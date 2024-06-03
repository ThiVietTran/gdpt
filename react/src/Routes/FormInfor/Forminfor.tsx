import React, { ChangeEvent, useState } from 'react';
import './Form.css';
import { Image } from 'semantic-ui-react'
import { Margin } from '@mui/icons-material';

const App: React.FC = () => {

    const [firstName, setFirstName] = useState<string>("");
    const [birthDate, setBirthDate] = useState<string>("");
    const [educationLevel, setEducationLevel] = useState<string>("");
    const [specializedDegree, setSpecializedDegree] = useState<string>("");
    const [specialTalents, setSpecialTalents] = useState<string>("");
    const [address, setAddress] = useState<string>("");
    const [fatherName, setFatherName] = useState<string>("");
    const [motherName, setMotherName] = useState<string>("");
    const [spouseName, setSpouseName] = useState<string>("");
    const [gdptJoinDate, setGdptJoinDate] = useState<string>("");
    const [firstTrainingDate, setFirstTrainingDate] = useState<string>("");
    const [firstPledgeDate, setFirstPledgeDate] = useState<string>("");
    const [dharmaName, setDharmaName] = useState<string>("");
    const [birthPlace, setBirthPlace] = useState<string>("");
    const [occupation, setOccupation] = useState<string>("");
    const [phoneNumber, setPhoneNumber] = useState<string>("");
    const [kien, setKien] = useState<string>("");
    const [kienYear, setKienYear] = useState<string>("");
    const [tri, setTri] = useState<string>("");
    const [triYear, setTriYear] = useState<string>("");
    const [dinh, setDinh] = useState<string>("");
    const [dinhYear, setDinhYear] = useState<string>("");
    const [luc, setLuc] = useState<string>("");
    const [lucYear, setLucYear] = useState<string>("");

    const [locUyen, setLocUyen] = useState<string>("");
    const [locUyenYear, setLocUyenYear] = useState<string>("");
    const [aDuc, setADuc] = useState<string>("");
    const [aDucYear, setADucYear] = useState<string>("");
    const [huyenTrang, setHuyenTrang] = useState<string>("");
    const [huyenTrangYear, setHuyenTrangYear] = useState<string>("");
    const [vanHanh, setVanHanh] = useState<string>("");
    const [vanHanhYear, setVanHanhYear] = useState<string>("");

    const [tapSuFrom, setTapSuFrom] = useState<string>("");
    const [tapSuTo, setTapSuTo] = useState<string>("");
    const [capTapFrom, setCapTapFrom] = useState<string>("");
    const [capTapTo, setCapTapTo] = useState<string>("");
    const [capTinFrom, setCapTinFrom] = useState<string>("");
    const [capTinTo, setCapTinTo] = useState<string>("");
    const [capTanFrom, setCapTanFrom] = useState<string>("");
    const [capTanTo, setCapTanTo] = useState<string>("");
    const [capDungFrom, setCapDungFrom] = useState<string>("");
    const [capDungTo, setCapDungTo] = useState<string>("");

    const [interruptionFrom1, setInterruptionFrom1] = useState<string>("");
    const [interruptionTo1, setInterruptionTo1] = useState<string>("");
    const [interruptionFrom2, setInterruptionFrom2] = useState<string>("");
    const [interruptionTo2, setInterruptionTo2] = useState<string>("");
    const [interruptionFrom3, setInterruptionFrom3] = useState<string>("");
    const [interruptionTo3, setInterruptionTo3] = useState<string>("");


    const handleSubmit = (e: React.FormEvent<HTMLFormElement>) => {
        e.preventDefault();
        console.log(
            firstName,
            birthDate,
            educationLevel,
            specializedDegree,
            specialTalents,
            address,
            fatherName,
            motherName,
            spouseName,
            gdptJoinDate,
            firstTrainingDate,
            firstPledgeDate,
            dharmaName,
            birthPlace,
            occupation,
            phoneNumber,
            kien,
            kienYear,
            tri,
            triYear,
            dinh,
            dinhYear,
            luc,
            lucYear,
            locUyen,
            locUyenYear,
            aDuc,
            aDucYear,
            huyenTrang,
            huyenTrangYear,
            vanHanh,
            vanHanhYear,
            tapSuFrom,
            tapSuTo,
            capTapFrom,
            capTapTo,
            capTinFrom,
            capTinTo,
            capTanFrom,
            capTanTo,
            capDungFrom,
            capDungTo,
            interruptionFrom1,
            interruptionTo1,
            interruptionFrom2,
            interruptionTo2,
            interruptionFrom3,
            interruptionTo3
        );



    };




    const handleReset = () => {
        setFirstName("");
        setBirthDate("");
        setEducationLevel("");
        setSpecializedDegree("");
        setSpecialTalents("");
        setAddress("");
        setFatherName("");
        setMotherName("");
        setSpouseName("");
        setGdptJoinDate("");
        setFirstTrainingDate("");
        setFirstPledgeDate("");
        setDharmaName("");
        setBirthPlace("");
        setOccupation("");
        setPhoneNumber("");
        setImage(null);
    };



    const [selectedImage, setSelectedImage] = useState(null);

    return (
        <div className="App">
            <div >
                <br />
                <h1>SÁCH TỊCH HUYNH TRƯỞNG</h1>
                <br />
                <br />
                <div className='formtext' >
                    {!selectedImage && (
                        <h3>Tải ảnh thẻ lên</h3>
                    )}
                    <br />
                </div>
                {selectedImage && (
                    <div className="image-container">
                        <img
                            className='image'
                            src={URL.createObjectURL(selectedImage)}
                            alt="Selected"
                        />
                        <br /><br />
                        <button className='btnremove' onClick={() => setSelectedImage(null)}>Remove</button>
                    </div>
                )}
                <br />

                <div className='form' >
                    {!selectedImage && (
                        <button className="button_upload"
                            onClick={() => document.getElementById('fileInput')?.click()}
                        >
                            Select Image
                        </button>
                    )}
                </div>
                <input
                    id="fileInput"
                    type="file"
                    name="myImage"
                    style={{ display: 'none' }}
                    onChange={(event) => {
                        if (event.target.files && event.target.files[0]) {
                            setSelectedImage(event.target.files[0]);
                        }
                    }}
                />


                <fieldset>

                    <form onSubmit={handleSubmit}>
                        <br/>
                        <br/>
                        <h2>LÝ LỊCH :</h2>
                        <label htmlFor="firstname">Họ và tên :</label>
                        <input
                            type="text"
                            name="firstname"
                            id="firstname"
                            value={firstName}
                            onChange={(e) => setFirstName(e.target.value)}
                            placeholder="Enter your name"
                            required
                        />
                        <div className='form-row'>
                            <label htmlFor="birthPlace">Nơi sinh :</label>
                            <input
                                type="text"
                                name="birthPlace"
                                id="birthPlace"
                                value={birthPlace}
                                onChange={(e) => setBirthPlace(e.target.value)}
                                placeholder="Enter birth place"
                                required
                            />
                            <label htmlFor="birthDate">Ngày tháng năm sinh :</label>
                            <div className='input_row'>
                                <input
                                    type="date"
                                    name="birthDate"
                                    id="birthDate"
                                    value={birthDate}
                                    onChange={(e) => setBirthDate(e.target.value)}
                                    placeholder="Enter your birth date"
                                    required
                                />
                            </div>
                        </div>
                        <label htmlFor="occupation">Nghề Nghiệp :</label>
                        <input
                            type="text"
                            name="occupation"
                            id="occupation"
                            value={occupation}
                            onChange={(e) => setOccupation(e.target.value)}
                            placeholder="Enter occupation"
                            required
                        />
                        <label htmlFor="phoneNumber">Số điện thoại :</label>
                        <input
                            type="tel"
                            name="phoneNumber"
                            id="phoneNumber"
                            value={phoneNumber}
                            onChange={(e) => setPhoneNumber(e.target.value)}
                            placeholder="Enter phone number"
                            required
                        />
                        <label htmlFor="educationLevel">Trình độ văn hóa :</label>
                        <input
                            type="text"
                            name="educationLevel"
                            id="educationLevel"
                            value={educationLevel}
                            onChange={(e) => setEducationLevel(e.target.value)}
                            placeholder="Enter your education level"
                            required
                        />
                        <label htmlFor="specializedDegree">Bằng cấp chuyên môn :</label>
                        <input
                            type="text"
                            name="specializedDegree"
                            id="specializedDegree"
                            value={specializedDegree}
                            onChange={(e) => setSpecializedDegree(e.target.value)}
                            placeholder="Enter your specialized degree"
                            required
                        />
                        <label htmlFor="specialTalents">Năng khiếu đặc biệt :</label>
                        <input
                            type="text"
                            name="specialTalents"
                            id="specialTalents"
                            value={specialTalents}
                            onChange={(e) => setSpecialTalents(e.target.value)}
                            placeholder="Enter your special talents"
                            required
                        />
                        <label htmlFor="address">Đia chỉ :</label>
                        <input
                            type="text"
                            name="address"
                            id="address"
                            value={address}
                            onChange={(e) => setAddress(e.target.value)}
                            placeholder="Enter your address"
                            required
                        />
                        <label htmlFor="fatherName">Họ và tên cha :</label>
                        <input
                            type="text"
                            name="fatherName"
                            id="fatherName"
                            value={fatherName}
                            onChange={(e) => setFatherName(e.target.value)}
                            placeholder="Enter your father's name"
                            required
                        />
                        <label htmlFor="motherName">Họ và tên mẹ :</label>
                        <input
                            type="text"
                            name="motherName"
                            id="motherName"
                            value={motherName}
                            onChange={(e) => setMotherName(e.target.value)}
                            placeholder="Enter your mother's name"
                            required
                        />
                        <label htmlFor="spouseName">Họ tên vợ hoặc chồng :</label>
                        <input
                            type="text"
                            name="spouseName"
                            id="spouseName"
                            value={spouseName}
                            onChange={(e) => setSpouseName(e.target.value)}
                            placeholder="Enter your spouse's name"
                            required
                        />

                        <h2>QUÁ TRÌNH SINH HOẠT GIA ĐÌNH PHẬT TỬ :</h2>
                        <label htmlFor="dharmaName">Pháp Danh :</label>
                        <input
                            type="text"
                            name="dharmaName"
                            id="dharmaName"
                            value={dharmaName}
                            onChange={(e) => setDharmaName(e.target.value)}
                            placeholder="Enter Dharma name"
                            required
                        />
                        <label htmlFor="gdptJoinDate">Gia nhập Gia Đình Phật Tử ngày :</label>
                        <input
                            type="date"
                            name="gdptJoinDate"
                            id="gdptJoinDate"
                            value={gdptJoinDate}
                            onChange={(e) => setGdptJoinDate(e.target.value)}
                            placeholder="Enter GDPT join date"
                            required
                        />
                        <h3>THỜI KỲ LÀM HUYNH TRƯỞNG</h3>
                        <label htmlFor="firstTrainingDate">Đầu tiên làm Huynh Trưởng Tập sự ngày :</label>
                        <input
                            type="date"
                            name="firstTrainingDate"
                            id="firstTrainingDate"
                            value={firstTrainingDate}
                            onChange={(e) => setFirstTrainingDate(e.target.value)}
                            placeholder="Enter first training date"
                            required
                        />
                        <label htmlFor="firstPledgeDate">Đầu tiên phát nguyện làm Huynh Trưởng ngày :</label>
                        <input
                            type="date"
                            name="firstPledgeDate"
                            id="firstPledgeDate"
                            value={firstPledgeDate}
                            onChange={(e) => setFirstPledgeDate(e.target.value)}
                            placeholder="Enter first pledge date"
                            required
                        />
                        <h3>Đã trúng cách chương trình Tu học Huynh Trưởng :</h3>
                        <label htmlFor="kien">Bậc Kiên :</label>
                        <input
                            type="text"
                            name="kien"
                            id="kien"
                            value={kien}
                            onChange={(e) => setKien(e.target.value)}
                            placeholder="Enter Kien"
                            required
                        />
                        <label htmlFor="kienYear">Khóa năm :</label>
                        <input
                            type="text"
                            name="kienYear"
                            id="kienYear"
                            value={kienYear}
                            onChange={(e) => setKienYear(e.target.value)}
                            placeholder="Enter year"
                            required
                        />
                        <label htmlFor="tri">Bậc Trì :</label>
                        <input
                            type="text"
                            name="tri"
                            id="tri"
                            value={tri}
                            onChange={(e) => setTri(e.target.value)}
                            placeholder="Enter Tri"
                            required
                        />
                        <label htmlFor="triYear">Khóa năm :</label>
                        <input
                            type="text"
                            name="triYear"
                            id="triYear"
                            value={triYear}
                            onChange={(e) => setTriYear(e.target.value)}
                            placeholder="Enter year"
                            required
                        />
                        <label htmlFor="dinh">Bậc Định :</label>
                        <input
                            type="text"
                            name="dinh"
                            id="dinh"
                            value={dinh}
                            onChange={(e) => setDinh(e.target.value)}
                            placeholder="Enter Dinh"
                            required
                        />
                        <label htmlFor="dinhYear">Khóa năm :</label>
                        <input
                            type="text"
                            name="dinhYear"
                            id="dinhYear"
                            value={dinhYear}
                            onChange={(e) => setDinhYear(e.target.value)}
                            placeholder="Enter year"
                            required
                        />
                        <label htmlFor="luc">Bậc Lực:</label>
                        <input
                            type="text"
                            name="luc"
                            id="luc"
                            value={luc}
                            onChange={(e) => setLuc(e.target.value)}
                            placeholder="Enter Luc"
                            required
                        />
                        <label htmlFor="lucYear">Khóa năm :</label>
                        <input
                            type="text"
                            name="lucYear"
                            id="lucYear"
                            value={lucYear}
                            onChange={(e) => setLucYear(e.target.value)}
                            placeholder="Enter year"
                            required
                        />

                        <h3>Đã trúng cách chương trình Huấn luyện Huynh Trưởng :</h3>
                        <label htmlFor="locUyen">Trại Lộc Uyển :</label>
                        <input
                            type="text"
                            name="locUyen"
                            id="locUyen"
                            value={locUyen}
                            onChange={(e) => setLocUyen(e.target.value)}
                            placeholder="Enter Loc Uyen"
                            required
                        />
                        <label htmlFor="locUyenYear">Khóa năm :</label>
                        <input
                            type="text"
                            name="locUyenYear"
                            id="locUyenYear"
                            value={locUyenYear}
                            onChange={(e) => setLocUyenYear(e.target.value)}
                            placeholder="Enter year"
                            required
                        />
                        <label htmlFor="aDuc">Trại A Dục:</label>
                        <input
                            type="text"
                            name="aDuc"
                            id="aDuc"
                            value={aDuc}
                            onChange={(e) => setADuc(e.target.value)}
                            placeholder="Enter A Duc"
                            required
                        />
                        <label htmlFor="aDucYear">Khóa năm :</label>
                        <input
                            type="text"
                            name="aDucYear"
                            id="aDucYear"
                            value={aDucYear}
                            onChange={(e) => setADucYear(e.target.value)}
                            placeholder="Enter year"
                            required
                        />
                        <label htmlFor="huyenTrang">Trại Huyền Trang :</label>
                        <input
                            type="text"
                            name="huyenTrang"
                            id="huyenTrang"
                            value={huyenTrang}
                            onChange={(e) => setHuyenTrang(e.target.value)}
                            placeholder="Enter Huyen Trang"
                            required
                        />
                        <label htmlFor="huyenTrangYear">Khóa năm :</label>
                        <input
                            type="text"
                            name="huyenTrangYear"
                            id="huyenTrangYear"
                            value={huyenTrangYear}
                            onChange={(e) => setHuyenTrangYear(e.target.value)}
                            placeholder="Enter year"
                            required
                        />
                        <label htmlFor="vanHanh">Trại Vạn Hạnh :</label>
                        <input
                            type="text"
                            name="vanHanh"
                            id="vanHanh"
                            value={vanHanh}
                            onChange={(e) => setVanHanh(e.target.value)}
                            placeholder="Enter Van Hanh"
                            required
                        />
                        <label htmlFor="vanHanhYear">Khóa năm :</label>
                        <input
                            type="text"
                            name="vanHanhYear"
                            id="vanHanhYear"
                            value={vanHanhYear}
                            onChange={(e) => setVanHanhYear(e.target.value)}
                            placeholder="Enter year"
                            required
                        />

                        <h3>Thâm niên Huynh Trưởng :</h3>
                        <label htmlFor="tapSuFrom">Huynh Trưởng Tập Sự :</label>
                        <input
                            type="text"
                            name="tapSuFrom"
                            id="tapSuFrom"
                            value={tapSuFrom}
                            onChange={(e) => setTapSuFrom(e.target.value)}
                            placeholder="From"
                            required
                        />
                        <input
                            type="text"
                            name="tapSuTo"
                            id="tapSuTo"
                            value={tapSuTo}
                            onChange={(e) => setTapSuTo(e.target.value)}
                            placeholder="To"
                            required
                        />
                        <label htmlFor="capTapFrom">Huynh Trưởng Cấp Tập :</label>
                        <input
                            type="text"
                            name="capTapFrom"
                            id="capTapFrom"
                            value={capTapFrom}
                            onChange={(e) => setCapTapFrom(e.target.value)}
                            placeholder="From"
                            required
                        />
                        <input
                            type="text"
                            name="capTapTo"
                            id="capTapTo"
                            value={capTapTo}
                            onChange={(e) => setCapTapTo(e.target.value)}
                            placeholder="To"
                            required
                        />
                        <label htmlFor="capTinFrom">Huynh Trưởng Cấp Tín :</label>
                        <input
                            type="text"
                            name="capTinFrom"
                            id="capTinFrom"
                            value={capTinFrom}
                            onChange={(e) => setCapTinFrom(e.target.value)}
                            placeholder="From"
                            required
                        />
                        <input
                            type="text"
                            name="capTinTo"
                            id="capTinTo"
                            value={capTinTo}
                            onChange={(e) => setCapTinTo(e.target.value)}
                            placeholder="To"
                            required
                        />
                        <label htmlFor="capTanFrom">Huynh Trưởng Cấp Tấn :</label>
                        <input
                            type="text"
                            name="capTanFrom"
                            id="capTanFrom"
                            value={capTanFrom}
                            onChange={(e) => setCapTanFrom(e.target.value)}
                            placeholder="From"
                            required
                        />
                        <input
                            type="text"
                            name="capTanTo"
                            id="capTanTo"
                            value={capTanTo}
                            onChange={(e) => setCapTanTo(e.target.value)}
                            placeholder="To"
                            required
                        />
                        <label htmlFor="capDungFrom">Huynh Trưởng Cấp Dũng :</label>
                        <input
                            type="text"
                            name="capDungFrom"
                            id="capDungFrom"
                            value={capDungFrom}
                            onChange={(e) => setCapDungFrom(e.target.value)}
                            placeholder="From"
                            required
                        />
                        <input
                            type="text"
                            name="capDungTo"
                            id="capDungTo"
                            value={capDungTo}
                            onChange={(e) => setCapDungTo(e.target.value)}
                            placeholder="To"
                            required
                        />

                        <h3>Thời gian gián đoạn :</h3>
                        <label htmlFor="interruptionFrom1">Từ năm :</label>
                        <input
                            type="text"
                            name="interruptionFrom1"
                            id="interruptionFrom1"
                            value={interruptionFrom1}
                            onChange={(e) => setInterruptionFrom1(e.target.value)}
                            placeholder="From"
                            required
                        />
                        <label htmlFor="interruptionTo1">Đến năm :</label>
                        <input
                            type="text"
                            name="interruptionTo1"
                            id="interruptionTo1"
                            value={interruptionTo1}
                            onChange={(e) => setInterruptionTo1(e.target.value)}
                            placeholder="To"
                            required
                        />
                        <label htmlFor="interruptionFrom2">Từ năm :</label>
                        <input
                            type="text"
                            name="interruptionFrom2"
                            id="interruptionFrom2"
                            value={interruptionFrom2}
                            onChange={(e) => setInterruptionFrom2(e.target.value)}
                            placeholder="From"
                            required
                        />
                        <label htmlFor="interruptionTo2">Đến năm :</label>
                        <input
                            type="text"
                            name="interruptionTo2"
                            id="interruptionTo2"
                            value={interruptionTo2}
                            onChange={(e) => setInterruptionTo2(e.target.value)}
                            placeholder="To"
                            required
                        />
                        <label htmlFor="interruptionFrom3">Từ năm :</label>
                        <input
                            type="text"
                            name="interruptionFrom3"
                            id="interruptionFrom3"
                            value={interruptionFrom3}
                            onChange={(e) => setInterruptionFrom3(e.target.value)}
                            placeholder="From"
                            required
                        />
                        <label htmlFor="interruptionTo3">Đến năm :</label>
                        <input
                            type="text"
                            name="interruptionTo3"
                            id="interruptionTo3"
                            value={interruptionTo3}
                            onChange={(e) => setInterruptionTo3(e.target.value)}
                            placeholder="To"
                            required
                        />
                        <br />

                        <button className='btnfooter' type="reset" onClick={handleReset}>Reset</button>
                        <button className='btnfooter' type="submit">Submit</button>

                    </form>
                </fieldset>
            </div>
        </div>
    );
};

export default App;
function setImage(arg0: null) {
    throw new Error('Function not implemented.');
}

