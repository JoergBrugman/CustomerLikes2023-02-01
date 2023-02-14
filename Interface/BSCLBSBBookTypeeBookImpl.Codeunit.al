codeunit 50210 "BSCL BSB Book Type eBook Impl." implements "BSB Book Type Process"
{
    procedure StartDeployBook();
    begin
        Message('PDF auf Portal zum Download bereitstellen');
    end;

    procedure StartDeliverBook();
    begin
        Message('E-Mail an Besteller mit Download-Link versenden');
    end;
}