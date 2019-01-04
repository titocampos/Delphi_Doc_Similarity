unit UToken;
//
// Doc Similarity
// Author: Rodolpho Nascimento
// Email: contato@essencialcode.com.br
// 
// An example of a tool that compute similarity between documents using text mining technique, made using Delphi 10.2. 
// The measure used for this is a cosine distance method. This is a unsupervised learning from Machine Learning field.
//  
// Feel free to use in commercial purposes. Enjoy it!

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

