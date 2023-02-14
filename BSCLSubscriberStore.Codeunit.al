codeunit 50200 "BSCL Subscriber Store"
{
    var
        OnBeforOnDeleteBSBBookErr: label 'You are not allowed to delete %1 %2 because it is liked by one or more customr(s)';

    [EventSubscriber(ObjectType::Table, Database::"BSB Book", 'OnBeforeOnDelete', '', true, true)]
    local procedure OnBeforeOnDeleteBSBBook(var Rec: Record "BSB Book"; var IsHandled: Boolean)
    var
        Customer: Record Customer;
    begin
        if IsHandled then
            exit;

        Customer.SetCurrentKey("BSB Favorite Book No.");
        Customer.SetRange("BSB Favorite Book No.", Rec."No.");
        if not Customer.IsEmpty then
            Error(OnBeforOnDeleteBSBBookErr, Rec.TableCaption, Rec."No.");
        IsHandled := true;
    end;
}