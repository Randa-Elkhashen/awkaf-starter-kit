export function ValidateNationalID(sNationalID) {
    if (sNationalID.length === 0) return true;
    if (sNationalID.length !== 14) return false;
    //////////////////////////////////
    if (isNaN(sNationalID)) return false;
    ////////////////////////////////////
    let sCenturytmp = sNationalID.substr(0, 1);
    let arrCentury = Array("1", "2", "3");
    if (arrCentury.indexOf(sCenturytmp) === -1) return false;
    ////////////////////////////////////
    let sDate = "18";
    if (sCenturytmp === "2") sDate = "19";
    if (sCenturytmp === "3") sDate = "20";
    sDate = sDate + sNationalID.substr(1, 2) + "/" + sNationalID.substr(3, 2) + "/" + sNationalID.substr(5, 2);
    if (isNaN(Date.parse(sDate))) return false;
    /////////////////////////////////
    let sGisGovernorateCodeList = Array("01", "02", "03", "04", "05", "06", "11", "12", "13", "14", "15", "16", "17", "18", "19", "21", "22", "23", "24", "25", "26", "27", "28", "29", "31", "32", "33", "34", "35", "88");
    if (sGisGovernorateCodeList.indexOf(sNationalID.substr(7, 2)) === -1) return false;
    ////////////////////////////////
    //Const Check Digit  
    const nConstCentury = 2;

    const nConstYearFirstNo = 7;
    const nConstYearSecondNo = 6;
    const nConstMonthFirstNo = 5;
    const nConstMonthSecondNo = 4;

    const nConstDayFirstNo = 3;
    const nConstDaySecondNo = 2;
    const nConstGovFirstNo = 7;
    const nConstGovSecondNo = 6;

    const nConstSerialFirstNo = 5;
    const nConstSerialSecondNo = 4;
    const nConstSerialThirdNo = 3;

    const nConstGender = 2;

    //Check Digit Value
    const nCentury = sNationalID.substr(0, 1);
    const nYearFirstNo = sNationalID.substr(1, 1);
    const nYearSecondNo = sNationalID.substr(2, 1);

    const nMonthFirstNo = sNationalID.substr(3, 1);
    const nMonthSecondNo = sNationalID.substr(4, 1);

    const nDayFirstNo = sNationalID.substr(5, 1);
    const nDaySecondNo = sNationalID.substr(6, 1);

    const nGovFirstNo = sNationalID.substr(7, 1);
    const nGovSecondNo = sNationalID.substr(8, 1);

    const nSerialFirstNo = sNationalID.substr(9, 1);
    const nSerialSecondNo = sNationalID.substr(10, 1);
    const nSerialThirdNo = sNationalID.substr(11, 1);

    const nGender = sNationalID.substr(12, 1);

    const nCheckDigit = sNationalID.substr(13, 1);

    //Check Digit Sum
    const nCheckDigitSum = (nConstCentury * nCentury) +

        (nConstYearFirstNo * nYearFirstNo) +
        (nConstYearSecondNo * nYearSecondNo) +

        (nConstMonthFirstNo * nMonthFirstNo) +
        (nConstMonthSecondNo * nMonthSecondNo) +

        (nConstDayFirstNo * nDayFirstNo) +
        (nConstDaySecondNo * nDaySecondNo) +

        (nConstGovFirstNo * nGovFirstNo) +
        (nConstGovSecondNo * nGovSecondNo) +

        (nConstSerialFirstNo * nSerialFirstNo) +
        (nConstSerialSecondNo * nSerialSecondNo) +
        (nConstSerialThirdNo * nSerialThirdNo) +

        (nConstGender * nGender);
    const nCheckDigitSumMode = (11 - (nCheckDigitSum % 11)).toString();
    const right = nCheckDigitSumMode.substr(nCheckDigitSumMode.length - 1, 1);
    return right === nCheckDigit;
}
export function GetNationalIDInfo(sNationalID) {
    if (ValidateNationalID(sNationalID)) {
        var nationalIDInfo = {};
        let sCenturytmp = sNationalID.substr(0, 1);

        nationalIDInfo.nCentury = sCenturytmp;
        let sDate = "18";
        if (sCenturytmp === "2") sDate = "19";
        if (sCenturytmp === "3") sDate = "20";
        sDate = sDate + sNationalID.substr(1, 2) + "/" + sNationalID.substr(3, 2) + "/" + sNationalID.substr(5, 2);
        nationalIDInfo.dBirthDate = new Date(sDate);
        nationalIDInfo.birthGovernorate = sNationalID.substr(7, 2);
        nationalIDInfo.nGenderCode = 0;
        if (sNationalID.substr(12, 1) % 2) {
            nationalIDInfo.nGenderCode = 1;
        }

        return nationalIDInfo;
    }
}