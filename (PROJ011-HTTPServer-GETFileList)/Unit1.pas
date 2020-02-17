unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdBaseComponent, IdComponent, IdTCPServer, StdCtrls, FileCtrl;

type
  TForm1 = class(TForm)
    TCPS: TIdTCPServer;
    FLB: TFileListBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ListBox1: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure TCPSExecute(AThread: TIdPeerThread);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1; path: string;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
    path:='D:\氣往\(final pro)';
    FLB.Directory:=path;
end;

procedure TForm1.TCPSExecute(AThread: TIdPeerThread);
var e, s, s2, ans,ans2, fname: string; i, k, sz: integer; ms: TMemorystream;
begin
    e:='''';
    s2:='http://127.0.0.1:7001';
    repeat
        s:=AThread.Connection.ReadLn();
        FLB.Refresh;
    until s='';

    FLB.Refresh;
    FLB.Update;
    ans:='<html><script language="javascript">';
    for i:=0 to FLB.Count-1 do
    begin
        ans2:=ans2+'function inpic'+inttostr(i)+'() { document.mypic.src=document.n'+inttostr(i)+'.src }';
    end;
    FLB.Refresh;
    ans:=ans+ans2+'</script><div><div aligh="left" style="float:left"><img src="'+s2+'/apple.jpg" alt="" name="mypic" height="90%" id="mypic"></div><div align="right"><table style="border-top:3px #82FFFF solid;border-bottom:3px #82FFFF solid;border-right:3px #FFD382 solid;border-left:3px #FFD382 solid;" border=1 width=20% >';
    for i:=0 to FLB.Count-1 do
    begin
        ans:=ans+'<tr onMouseOver="this.style.backgroundColor='+e+'faffb8'+e+'" onMouseOut="this.style.backgroundColor='+e+'white'+e+'"><th><div aldin="left" style="float:left"><img src="'+s2+'/'+FLB.Items[i]+'" width=40 alt="" name=n'+inttostr(i)+' id=n'+inttostr(i)+' onmouseover=inpic'+inttostr(i)+'()></div><a href="'+s2+'/'+FLB.Items[i]+'" target="f1" >'
            +FLB.Items[i]+'</div><div class="cursors"><div class="'+s2+'/'+FLB.Items[i]+'"></div></a>     <a href="'+FLB.Items[i]+'" download="">下載</a></th></tr>';

    end;
    ans:=ans+'</table><br><form method="POST" action="http://127.0.0.1:7000/postphp.php" enctype="multipart/form-data">File:<input type="file" id="f001" name="f001"></input></br><br><input type="submit"></input></form></div></div></html>';

    AThread.Connection.WriteLn('HTTP 200 OK');
    AThread.Connection.WriteLn('Content-Length: '+ inttostr(length(ans)+2) );
    AThread.Connection.WriteLn('');
    AThread.Connection.WriteLn(ans);
end;
     //<form method="POST" action="http://127.0.0.1:7000/postphp.php" enctype="multipart/form-data">File:<input type="file" id="f001" name="f001"></input><br><input type="submit"></input></form><body><a href="data1.txt">請下載</a></body>
end.
//
