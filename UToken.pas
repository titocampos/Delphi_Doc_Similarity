unit UToken;

interface

uses
  SysUtils, System.StrUtils,  Math;


type
  TToken = class
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

constructor TToken.Create;
begin

end;

destructor TToken.Destroy;
begin

  inherited;
end;


procedure TToken.SetName(const Value: String);
begin
  FName := Value;
end;

procedure TToken.SetOccurrNumber(const Value: Integer);
begin
  FOccurrNumber := Value;
end;



end.

