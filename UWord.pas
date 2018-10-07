unit UWord;

interface

uses
  SysUtils, System.StrUtils,  Math;


type
  TWord = class
  private
    FName: String;
    FOccurrNumber: Integer;
    procedure SetName(const Value: String);
    procedure SetOccurrNumber(const Value: Integer);

  public
    constructor Create;
    destructor Destroy; override;

    property OccurrNumber: Integer read FOccurrNumber write SetOccurrNumber;
    property Name: String read FName write SetName;
  end;

implementation

{ TPalavra }

constructor TWord.Create;
begin

end;

destructor TWord.Destroy;
begin

  inherited;
end;


procedure TWord.SetName(const Value: String);
begin
  FName := Value;
end;

procedure TWord.SetOccurrNumber(const Value: Integer);
begin
  FOccurrNumber := Value;
end;



end.

