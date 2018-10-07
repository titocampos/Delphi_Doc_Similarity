unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, UComparer,
  VclTee.TeeGDIPlus, VCLTee.TeEngine, VCLTee.TeeProcs, VCLTee.Chart,
  VCLTee.Series;

type
  TFrmMain = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    mmBaseText: TMemo;
    Panel3: TPanel;
    Pg: TPageControl;
    TbsText2: TTabSheet;
    TbsText3: TTabSheet;
    TbsText4: TTabSheet;
    TbsText5: TTabSheet;
    Panel4: TPanel;
    TbsText1: TTabSheet;
    BtCheck: TButton;
    Pnl1: TPanel;
    Pnl2: TPanel;
    Pnl3: TPanel;
    pnl4: TPanel;
    Pnl5: TPanel;
    mmText1: TMemo;
    mmText2: TMemo;
    mmText3: TMemo;
    mmText4: TMemo;
    mmText5: TMemo;
    TbsText6: TTabSheet;
    Chart: TChart;
    Series1: TBarSeries;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtCheckClick(Sender: TObject);
  private
    { Private declarations }
    Comparer: TComparer;

    procedure init;
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

procedure TFrmMain.BtCheckClick(Sender: TObject);
var
  i: SmallInt;
  Memo: TMemo;
  Panel: TPanel;
  Tab: TTabSheet;
  Score: Double;
  Status: String;
begin
  Score := 0;


  Series1.Clear;

  for i := 1 to 5 do
  begin
    Memo  := TMemo(FindComponent('mmText' + IntToStr(i)));
    Panel := TPanel(FindComponent('Pnl' + IntToStr(i)));
    Tab   := TTabSheet(FindComponent('TbsText' + IntToStr(i)));

    case Comparer.checkCompatibility(mmBaseText.Text, Memo.Text) of

      CompNoOne: begin
                     Status := 'Nothing';
                     Tab.Caption := 'Text ' + IntToStr(i);
                   end;

      CompVeryLow: begin
                     Status := 'Very low';
                     Tab.Caption := 'Text ' + IntToStr(i);
                   end;

      CompLow: begin
                 Status := 'low';
                 Tab.Caption := 'Text ' + IntToStr(i);
               end;

      CompMedium:begin
                   Status := 'Medium';
                   Tab.Caption := 'Text ' + IntToStr(i);
                 end;

      CompHigh: begin
                  Status := 'High';
                  Tab.Caption := 'Text ' + IntToStr(i);
                end;

      CompVeryHigh: begin
                      Status := 'Very high';
                      Tab.Caption := 'Text ' + IntToStr(i);
                    end;
    end;

    Panel.Caption := 'Similarity measure: ' + FloatToStr(Comparer.CorrelationValue) + sLineBreak +
                     '.  Base text number of words: ' + IntToStr(Comparer.BaseTextNumWords) + sLineBreak +
                     '.  Text to compare number of words: ' + IntToStr(Comparer.TextToCompareNumWords);

    // Plotting data...
    Series1.AddY(Comparer.CorrelationValue, 'Text ' + IntToStr(i) + sLineBreak + Status);
  end;

  Pg.ActivePage := TbsText6;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  Comparer := TComparer.Create;
  init;
end;

procedure TFrmMain.FormDestroy(Sender: TObject);
begin
  FreeAndNil(Comparer);
end;

procedure TFrmMain.init;
var
  i: SmallInt;
  Tb: TTabSheet;
begin
  for i := 0 to 4 do
  begin
    Tb := Pg.Pages[i];
    Tb.Caption := 'Text ' + IntToStr(i+1) + ' - not init';
  end;

  Pg.ActivePageIndex := 0;



end;

end.
