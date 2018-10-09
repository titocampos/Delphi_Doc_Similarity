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
 'para', 'é', 'com', 'não', 'uma', 'os',
 'no', 'se', 'na', 'por', 'mais', 'as',
 'dos', 'como', 'mas', 'foi', 'ao', 'ele',
 'das', 'tem', 'à', 'seu', 'sua', 'ou',
 'ser', 'quando', 'muito', 'nos', 'já',
 'está', 'eu', 'também', 'só', 'pelo', 'pela',
 'até', 'isso', 'ela', 'entre', 'era', 'depois',
 'sem', 'mesmo', 'aos', 'ter', 'seus', 'quem',
 'nas', 'me', 'esse', 'eles', 'estão', 'você',
 'tinha', 'foram', 'essa', 'num', 'nem', 'suas',
 'meu', 'às', 'minha', 'têm', 'numa', 'pelos',
 'elas', 'havia', 'seja', 'qual', 'será', 'nós',
 'tenho', 'lhe', 'deles', 'essas', 'esses', 'pelas',
 'este', 'fosse', 'dele', 'tu', 'te', 'vocês',
 'vos', 'lhes', 'meus', 'minhas', 'teu', 'tua',
 'teus', 'tuas', 'nosso', 'nossa', 'nossos', 'nossas',
 'dela', 'delas', 'esta', 'estes', 'estas', 'aquele',
 'aquela', 'aqueles', 'aquelas', 'isto', 'aquilo', 'estou',
 'estamos', 'estive', 'esteve', 'estivemos',
 'estiveram', 'estava', 'estávamos', 'estavam', 'estivera', 'estivéramos',
 'esteja', 'estejamos', 'estejam', 'estivesse', 'estivéssemos', 'estivessem',
 'estiver', 'estivermos', 'estiverem', 'hei', 'há', 'havemos',
 'hão', 'houve', 'houvemos', 'houveram', 'houvera', 'houvéramos',
 'haja', 'hajamos', 'hajam', 'houvesse', 'houvéssemos', 'houvessem',
 'houver', 'houvermos', 'houverem', 'houverei', 'houverá', 'houveremos',
 'houverão', 'houveria', 'houveríamos', 'houveriam', 'sou', 'somos',
 'são', 'éramos', 'eram', 'fui',
 'fomos', 'foram', 'fora', 'fôramos', 'seja', 'sejamos',
 'sejam', 'fosse', 'fôssemos', 'fossem', 'for', 'formos',
 'forem', 'serei', 'será', 'seremos', 'serão', 'seria',
 'seríamos', 'seriam', 'tenho', 'tem', 'temos', 'tém',
 'tinha', 'tínhamos', 'tinham', 'tive', 'teve', 'tivemos',
 'tiveram', 'tivera', 'tivéramos', 'tenha', 'tenhamos', 'tenham',
 'tivesse', 'tivéssemos', 'tivessem', 'tiver', 'tivermos', 'tiverem',
 'terei', 'terá', 'teremos', 'terão', 'teria', 'teríamos',
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

