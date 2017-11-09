unit SecurityUtil;

interface

uses
  SysUtils, LbCipher, LbClass, Math;


function GetSuperUserCredentials(var AName, AKey: string): boolean;
function GetKey(const phrase: string; const toUpper: boolean = false): string;

implementation

const
  APPKEY = 'Jet Construction Expense Management System Version 2';
  KEYLENGTH = 6;

function GetSuperUserCredentials(var AName, AKey: string): boolean;
var
  encryptor: TLbRijndael;
  encrypted, decrypted: AnsiString;
  randomStr: string;
begin
  Result := false;
  encryptor := TLbRijndael.Create(nil);
  try
    try
      randomStr := IntToStr(RandomRange(1000,9999));
      encrypted := encryptor.EncryptString(randomStr + FormatDateTime('ssmmhhmmddyyyy',Date) + APPKEY);
      AName := UpperCase(Copy(encrypted,0,KEYLENGTH));
      AKey := UpperCase(GetKey(AName));
      Result := true;
    except

    end;
  finally
    encryptor.Free;
  end;
end;

function GetKey(const phrase: string; const toUpper: boolean = false): string;
var
  encryptor: TLbRijndael;
  encrypted, decrypted: AnsiString;
begin
  encryptor := TLbRijndael.Create(nil);
  try
    encrypted := encryptor.EncryptString(phrase + FormatDateTime('ssmmhhmmddyyyy',Date) + APPKEY);
    Result := Copy(encrypted,0,KEYLENGTH);
    if toUpper then Result := UpperCase(Result);
  finally
    encryptor.Free;
  end;
end;

end.
