unit UComparer;


interface


uses
  SysUtils, System.StrUtils, System.Generics.Collections, System.Generics.Defaults,
  System.Types,Variants, Math,
  UToken, Data.DBXJSON, Data.DBXJSONReflect;


type
  TTokenLst = class(TObjectDictionary<String,TToken>)
  end;

  TCompabilityResult = (CompNoOne,
                        CompVeryLow,
                        CompLow,
                        CompMedium,
                        CompHigh,
                        CompVeryHigh);

  TComparer = class
  private
    FStopWords: TTokenLst;
    FCorrelationValue,
    FCorrelationPercent: Double;
    FBaseTextNumTokens,
    FTextToCompareNumTokens,
    FTokensIntersections: Integer;

    function preProcessText(const Text: String): String;

    function computeInnerProduct(Lst: TTokenLst): Double;
    procedure computeCorrelation(const BaseText, TextToCompare: String);

    procedure tokenize(const Text: String; Lst: TTokenLst);
    procedure loadStopTokens;

  public

    constructor Create;
    destructor Destroy; override;

    property CorrelationPercent: Double read FCorrelationPercent;
    property CorrelationValue: Double read FCorrelationValue;
    property TokensIntersections: Integer read FTokensIntersections;
    property BaseTextNumTokens: integer read FBaseTextNumTokens;
    property TextToCompareNumTokens: integer read FTextToCompareNumTokens;

    function checkCompatibility(const BaseText, CompareText: String): TCompabilityResult;
  end;


implementation

{ TAnalisador }


function TComparer.computeInnerProduct(Lst: TTokenLst): Double;
var
  Token: TToken;
begin
  Result := 0;
  for Token in Lst.Values do
  begin
    Result := Result + Power(Token.OccurrNumber, 2);
  end;
end;


procedure TComparer.computeCorrelation(const BaseText, TextToCompare: String);
var
  TokenA, TokenB: TToken;
  LstA, LstB,
  SmallerLst, GreatherLst: TTokenLst;
  DotProduct_LstA, DotProduct_LstB: Double;

begin
  // Initialize vars...
  LstA := nil;
  LstB := nil;

  try
    LstA   := TTokenLst.Create([doOwnsValues]);
    LstB   := TTokenLst.Create([doOwnsValues]);
    FCorrelationValue := 0;

    // The tokenizing process...
    tokenize(BaseText,      LstA);
    tokenize(TextToCompare, LstB);

    // Count number of tokens
    FBaseTextNumTokens      := LstA.Count;
    FTextToCompareNumTokens := LstB.Count;

    // Start by less count list, to perform process
    if (LstA.Count <= LstB.Count) then
    begin
      SmallerLst  := LstA;
      GreatherLst := LstB;
    end
    else
    begin
      SmallerLst  := LstB;
      GreatherLst := LstA;
    end;

    // Compute dot product for each token list
    DotProduct_LstA := computeInnerProduct(LstA);
    DotProduct_LstB := computeInnerProduct(LstB);

    FTokensIntersections := 0;

    // Start the iteration by less list count...
    for TokenA in SmallerLst.Values do
    begin
      // Discart stop-words
      if FStopWords.ContainsKey(TokenA.Name) then
        Continue;

      // Calculate vector's distance by cosine method
      if GreatherLst.TryGetValue(TokenA.Name, TokenB) then
      begin
        FCorrelationValue := FCorrelationValue + (TokenA.OccurrNumber * TokenB.OccurrNumber);
        Inc(FTokensIntersections);
      end;
    end;

    FCorrelationValue   := FCorrelationValue / (Sqrt(DotProduct_LstA) * Sqrt(DotProduct_LstB));
    FCorrelationValue   := RoundTo(FCorrelationValue, -4);
    FCorrelationPercent := (FCorrelationValue * 100);


  finally
    LstA.Free;
    LstB.Free;
  end;
end;

procedure TComparer.loadStopTokens;
const
  StopTokenLst: Array[1..215] of String =
('de', 'a', 'o',
 'que', 'e', 'do', 'da', 'em', 'um',
 'para', '�', 'com', 'n�o', 'uma', 'os',
 'no', 'se', 'na', 'por', 'mais', 'as',
 'dos', 'como', 'mas', 'foi', 'ao', 'ele',
 'das', 'tem', '�', 'seu', 'sua', 'ou',
 'ser', 'quando', 'muito', 'nos', 'j�',
 'est�', 'eu', 'tamb�m', 's�', 'pelo', 'pela',
 'at�', 'isso', 'ela', 'entre', 'era', 'depois',
 'sem', 'mesmo', 'aos', 'ter', 'seus', 'quem',
 'nas', 'me', 'esse', 'eles', 'est�o', 'voc�',
 'tinha', 'foram', 'essa', 'num', 'nem', 'suas',
 'meu', '�s', 'minha', 't�m', 'numa', 'pelos',
 'elas', 'havia', 'seja', 'qual', 'ser�', 'n�s',
 'tenho', 'lhe', 'deles', 'essas', 'esses', 'pelas',
 'este', 'fosse', 'dele', 'tu', 'te', 'voc�s',
 'vos', 'lhes', 'meus', 'minhas', 'teu', 'tua',
 'teus', 'tuas', 'nosso', 'nossa', 'nossos', 'nossas',
 'dela', 'delas', 'esta', 'estes', 'estas', 'aquele',
 'aquela', 'aqueles', 'aquelas', 'isto', 'aquilo', 'estou',
 'estamos', 'estive', 'esteve', 'estivemos',
 'estiveram', 'estava', 'est�vamos', 'estavam', 'estivera', 'estiv�ramos',
 'esteja', 'estejamos', 'estejam', 'estivesse', 'estiv�ssemos', 'estivessem',
 'estiver', 'estivermos', 'estiverem', 'hei', 'h�', 'havemos',
 'h�o', 'houve', 'houvemos', 'houveram', 'houvera', 'houv�ramos',
 'haja', 'hajamos', 'hajam', 'houvesse', 'houv�ssemos', 'houvessem',
 'houver', 'houvermos', 'houverem', 'houverei', 'houver�', 'houveremos',
 'houver�o', 'houveria', 'houver�amos', 'houveriam', 'sou', 'somos',
 's�o', '�ramos', 'eram', 'fui',
 'fomos', 'foram', 'fora', 'f�ramos', 'seja', 'sejamos',
 'sejam', 'fosse', 'f�ssemos', 'fossem', 'for', 'formos',
 'forem', 'serei', 'ser�', 'seremos', 'ser�o', 'seria',
 'ser�amos', 'seriam', 'tenho', 'tem', 'temos', 't�m',
 'tinha', 't�nhamos', 'tinham', 'tive', 'teve', 'tivemos',
 'tiveram', 'tivera', 'tiv�ramos', 'tenha', 'tenhamos', 'tenham',
 'tivesse', 'tiv�ssemos', 'tivessem', 'tiver', 'tivermos', 'tiverem',
 'terei', 'ter�', 'teremos', 'ter�o', 'teria', 'ter�amos',
 'teriam');

var
  Token: TToken;
  TokenName: String;

begin
  FStopWords.Clear;

  for TokenName in StopTokenLst do
  begin
    Token := TToken.Create;
    Token.Name := TokenName;
    FStopWords.AddOrSetValue(TokenName,Token);
  end;
end;

constructor TComparer.Create;
begin
  FStopWords := TTokenLst.Create([doOwnsValues]);
  FCorrelationPercent := 0;
  FBaseTextNumTokens := 0;
  FTextToCompareNumTokens := 0;

  loadStopTokens;
end;

destructor TComparer.Destroy;
begin
  FStopWords.Free;
  inherited;
end;




procedure TComparer.tokenize(const Text: String; Lst: TTokenLst);
var
  TokenName, BaseToken, BaseText: String;
  NewToken: TToken;
begin
  Lst.Clear;

  // Preprocessing text...
  BaseText := preProcessText(Text);

  // Vectorizing text
  for TokenName in SplitString(BaseText,' ') do
  begin
    if (Trim(TokenName) = '') then
      Continue;

    BaseToken := TokenName;

    if FStopWords.ContainsKey(BaseToken) then
      Continue;

    if (not Lst.TryGetValue(BaseToken, NewToken)) then
    begin
      NewToken      := TToken.Create;
      NewToken.Name := BaseToken;
      NewToken.OccurrNumber := 1;
      Lst.Add(TokenName,NewToken);
    end
    else
    begin
      NewToken.OccurrNumber := NewToken.OccurrNumber + 1;
    end;
  end;
end;


function TComparer.checkCompatibility(const BaseText,CompareText: String): TCompabilityResult;
begin
  // Compute correlation between both texts
  computeCorrelation(BaseText, CompareText);

  // Define the class type
  if (CorrelationPercent <= 10) then
    Result := CompNoOne
  else
   if (CorrelationPercent > 10) and (CorrelationPercent <= 20) then
    Result := CompVeryLow
  else
  if (CorrelationPercent > 20) and (CorrelationPercent <= 40) then
    Result := CompLow
  else
  if (CorrelationPercent > 40) and (CorrelationPercent <= 60) then
    Result := CompMedium
  else
  if (CorrelationPercent > 60) and (CorrelationPercent <= 80) then
    Result := CompHigh
  else
    Result := CompVeryHigh;
end;


function TComparer.preProcessText(const Text: String): String;
begin
  Result := Text;
  Result := StringReplace(Result,'.',' ',[rfReplaceAll,rfIgnoreCase]);
  Result := StringReplace(Result,',',' ',[rfReplaceAll,rfIgnoreCase]);
  Result := StringReplace(Result,'~',' ',[rfReplaceAll,rfIgnoreCase]);
  Result := StringReplace(Result,sLineBreak,' ',[rfReplaceAll,rfIgnoreCase]);
  Result := AnsiLowerCase(Result);
end;






end.

