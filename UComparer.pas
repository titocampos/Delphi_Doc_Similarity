unit UComparer;


interface


uses
  SysUtils, System.StrUtils, System.Generics.Collections, System.Generics.Defaults,
  System.Types,Variants, Math,
  UWord, Data.DBXJSON, Data.DBXJSONReflect;


type
  TWordLst = class(TObjectDictionary<String,TWord>)
  end;

  TCompabilityResult = (CompNoOne,
                        CompVeryLow,
                        CompLow,
                        CompMedium,
                        CompHigh,
                        CompVeryHigh);

  TComparer = class
  private
    FStopWords: TWordLst;
    FCorrelationValue,
    FCorrelationPercent: Double;
    FBaseTextNumWords,
    FTextToCompareNumWords,
    FWordsIntersections: Integer;

    function preProcessText(const Text: String): String;

    function normalize(Lst: TWordLst): SmallInt;
    procedure computeCorrelation(const BaseText, TextToCompare: String);

    procedure buildWordLst(const Text: String; Lst: TWordLst);
    procedure loadStopWords;

  public

    constructor Create;
    destructor Destroy; override;

    property CorrelationPercent: Double read FCorrelationPercent;
    property CorrelationValue: Double read FCorrelationValue;
    property WordsIntersections: Integer read FWordsIntersections;
    property BaseTextNumWords: integer read FBaseTextNumWords;
    property TextToCompareNumWords: integer read FTextToCompareNumWords;

    function checkCompatibility(const BaseText, CompareText: String): TCompabilityResult;
  end;


implementation

{ TAnalisador }


function TComparer.normalize(Lst: TWordLst): SmallInt;
var
  Word: TWord;
  Total: Double;
begin
  Total := 0;
  for Word in Lst.Values do
  begin
    Total := Total + Power(Word.OccurrNumber,2);
  end;

  Result := Trunc(Sqrt(Total));
end;


procedure TComparer.computeCorrelation(const BaseText, TextToCompare: String);
var
  WordA, WordB: TWord;
  LstA, LstB,
  SmallerLst, GreatherLst: TWordLst;
  ValueA, ValueB,
  TotalOccurNumberA_Norm, TotalOccurNumberB_Norm: Double;

begin
  LstA := nil;
  LstB := nil;

  try
    LstA   := TWordLst.Create([doOwnsValues]);
    LstB   := TWordLst.Create([doOwnsValues]);
    FCorrelationValue := 0;

    buildWordLst(BaseText, LstA);
    buildWordLst(TextToCompare, LstB);

    FBaseTextNumWords      := LstA.Count;
    FTextToCompareNumWords := LstB.Count;

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

    TotalOccurNumberA_Norm := normalize(LstA);
    TotalOccurNumberB_Norm := normalize(LstB);
    FWordsIntersections := 0;

    for WordA in SmallerLst.Values do
    begin
      if FStopWords.ContainsKey(WordA.Name) then
        Continue;

      // Count TF...
      if GreatherLst.TryGetValue(WordA.Name, WordB) then
      begin
        ValueA := (WordA.OccurrNumber / TotalOccurNumberA_Norm);
        ValueB := (WordB.OccurrNumber / TotalOccurNumberB_Norm);
        FCorrelationValue := FCorrelationValue + (ValueA * ValueB);
        Inc(FWordsIntersections);
      end;
    end;

    FCorrelationValue   := RoundTo(FCorrelationValue,-2);
    FCorrelationPercent := (FCorrelationValue * 100);

    if (FCorrelationPercent > 100) then
      FCorrelationPercent := 100;


  finally
    LstA.Free;
    LstB.Free;
  end;
end;

procedure TComparer.loadStopWords;
const
  StopWordLst: Array[1..78] of String =
                  ('A','E','I','O','U',
                   'AS','ES','IS','OS','US',
                   'DA','DE','DI','DO','DU',
                   'DAS','DES','DIS','DOS','DUS',
                   'COMO','PARA','SIM','NÃO','COM',
                   'SE','SEU','SEUS','SUA','SUAS',
                   'NA','NAS','NO','NOS','QUE',
                   'POR','MAS','MESMO','MESMA',
                   'MESMOS','MESMAS','NESTE','NESTES',
                   'NESTA','NESTAS','Á','À','É','Í','Ó',
                   'AO','EM','FOI','UM','UMA',
                   'UNS','UMAS','SÃO','SÃOS',
                   'ELE','ELA','ELES','ELAS','TODO','TODAS',
                   'TUDO','ENTRE','FORAM','TAMBÉM',
                   'MAIS','MEU','MEUS','MINHA','MINHAS',
                   'PELO','PELOS','DESTA','VEZ');
var
  Word: TWord;
  WordName: String;

begin
  FStopWords.Clear;

  for WordName in StopWordLst do
  begin
    Word := TWord.Create;
    Word.Name := WordName;
    FStopWords.Add(WordName,Word);
  end;
end;

constructor TComparer.Create;
begin
  FStopWords := TWordLst.Create([doOwnsValues]);
  FCorrelationPercent := 0;
  FBaseTextNumWords := 0;
  FTextToCompareNumWords := 0;

  loadStopWords;
end;

destructor TComparer.Destroy;
begin
  FStopWords.Free;
  inherited;
end;



procedure TComparer.buildWordLst(const Text: String; Lst: TWordLst);
var
  WordName, BaseText: String;
  NewWord: TWord;
begin
  Lst.Clear;

  BaseText := preProcessText(Text);

  for WordName in SplitString(BaseText,' ') do
  begin
    if (Trim(WordName) = '') then
      Continue;

    if FStopWords.ContainsKey(WordName) then
      Continue;

    if (not Lst.TryGetValue(WordName, NewWord)) then
    begin
      NewWord      := TWord.Create;
      NewWord.Name := WordName;
      NewWord.OccurrNumber := 1;
      Lst.Add(WordName,NewWord);
    end
    else
    begin
      NewWord.OccurrNumber := NewWord.OccurrNumber + 1;
    end;
  end;
end;


function TComparer.checkCompatibility(const BaseText,CompareText: String): TCompabilityResult;
begin
  computeCorrelation(BaseText, CompareText);

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
  Result := StringReplace(Text,sLineBreak,' ',[rfReplaceAll,rfIgnoreCase]);
  Result := AnsiUpperCase(Result);
end;


end.

