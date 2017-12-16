Unit uutama;

Interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ShellAPI, FileCtrl, XPMan, ComCtrls, StdCtrls;

Type
  Tf0 = Class(TForm)
    c0: TLabel;
    c1: TDriveComboBox;
    c2: TButton;
    c3: TGroupBox;
    c4: TLabel;
    c5: TProgressBar;
    Procedure c2Click(Sender: TObject);
  Private
    { Deklarasi hanya untuk penggunaan dalam unit ini saja }
  Public
    { Deklarasi untuk penggunaan ke semua unit yang terintegerasi }
    va: longint;
    vb: String;
  End;

(*
Program :
Simple Wiper

Pengembang awal :
Arachmadi Putra Pambudi

Deskripsi :
Membersihkan jejak (sisa) file yang sudah terhapus dalam sebuah drive / partisi

Catatan :
Tools ini dibuat sesederhana mungkin sehingga anda dapat mempelajari dan mengembangkannya
Metode yang digunakan sangat sederhana yaitu mengisi space kosong pada drive dengan file random
Anda dapat mengubah file random tersebut, file bernama wiper.raw
Sebaiknya gunakan single-char copy supaya proses penindihan lebih efektif
Penamaan variabel sengaja di minimalkan agar anda juga turut mempelajari alur setiap prosedur dan fungsi
yang ada di proyek ini

Lisensi :
Gratis - Perangkat Lunak Sumber Terbuka
*)

Var
  f0: Tf0;

Implementation

{$R *.dfm} //template tweaked by : Araachmadi Putra Pambudi

Function fa(a: Char): longint;
Var
  b: String;
  c, d, e, f: DWord;
Begin
  b := a + ':\';
  GetDiskFreeSpace(PChar(b), c, d, e, f);
  Result := d * c * e;
End;

Function fb(a: Integer): String;
Var
  b: String;
Begin
  Randomize;
  b := 'qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234509876';
  Result := '';
  Repeat
    Result := Result + b[Random(Length(b)) + 1];
  Until (Length(Result) = a)
End;

Function fc(a: String): boolean;
Var
  b: TSHFileOpStruct;
Begin
  ZeroMemory(@b, SizeOf(b));
  With b Do
  Begin
    wFunc := FO_DELETE;
    fFlags := FOF_SILENT Or FOF_NOCONFIRMATION;
    pFrom := PChar(a + #0);
  End;
  Result := (0 = SHFileOperation(b));
End;

Procedure Tf0.c2Click(Sender: TObject);
Begin
  Try
    c2.Enabled := false;
    c3.Caption := 'Proses : menganalisa disk...';
    va := fa(c1.Drive);
    c5.Max := (va Div (1024 * 1024)) - 4;
    c4.Caption := '0 MB dari ' + inttostr(va Div 1024) + ' MB';
    vb := c1.Drive + ':\' + fb(32);
    MkDir(PChar(vb));
    c3.Caption := 'Proses : menghancurkan sisa sektor...';
    Repeat
      CopyFile(PChar(ExtractFilePath(Application.ExeName) + '\wiper.raw'), PChar(vb + '\' + fb(64)), true);
      Application.ProcessMessages;
      c5.Position := c5.Position + 4;
      c4.Caption := IntToStr(c5.Position) + ' MB dari ' + inttostr(va Div (1024 * 1024)) + ' MB';
    Until fa(c1.Drive) < 4096000;
    c3.Caption := 'Proses : menyelesaikan...';
    fc(vb);
    Application.ProcessMessages;
    ShowMessage('Drive anda berhasil dibersihkan !');
  Finally
    c5.Position := 0;
    c4.Caption := '0 b dari 0 b';
    c3.Caption := 'Proses : siap';
    c2.Enabled := true;
  End;
End;

End.

