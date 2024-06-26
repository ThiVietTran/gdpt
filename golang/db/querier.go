// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.15.0

package db

import (
	"context"
)

type Querier interface {
	CreateBacHoc(ctx context.Context, arg CreateBacHocParams) (BacHoc, error)
	CreateBhd(ctx context.Context, arg CreateBhdParams) (Bhd, error)
	CreateCapBac(ctx context.Context, arg CreateCapBacParams) (CapBac, error)
	CreateDamNhiemCVBHD(ctx context.Context, arg CreateDamNhiemCVBHDParams) (DamNhiemCvBhd, error)
	CreateDamNhiemCVDV(ctx context.Context, arg CreateDamNhiemCVDVParams) (DamNhiemCvDv, error)
	CreateDonVi(ctx context.Context, arg CreateDonViParams) (DonVi, error)
	CreateDongGopBHD(ctx context.Context, arg CreateDongGopBHDParams) (DongGopBhd, error)
	CreateDongGopDV(ctx context.Context, arg CreateDongGopDVParams) (DongGopDv, error)
	CreateHuynhTruong(ctx context.Context, arg CreateHuynhTruongParams) (HuynhTruong, error)
	CreateKetKhoaTraiHL(ctx context.Context, arg CreateKetKhoaTraiHLParams) (KetKhoaTraiHl, error)
	CreateNgayTraiHuanLuyen(ctx context.Context, arg CreateNgayTraiHuanLuyenParams) (NgayTraiHuanLuyen, error)
	CreateNgayTuHoc(ctx context.Context, arg CreateNgayTuHocParams) (NgayTuHoc, error)
	CreateNienKhoaBacHoc(ctx context.Context, arg CreateNienKhoaBacHocParams) (Nienkhoabachoc, error)
	CreateNienKhoaTraiHuanLuyen(ctx context.Context, arg CreateNienKhoaTraiHuanLuyenParams) (Nienkhoatraihuanluyen, error)
	CreatePost(ctx context.Context, arg CreatePostParams) (Post, error)
	CreateQuestion(ctx context.Context, arg CreateQuestionParams) (Question, error)
	CreateReset(ctx context.Context, arg CreateResetParams) (Reset, error)
	CreateThiBacHoc(ctx context.Context, arg CreateThiBacHocParams) (ThiBacHoc, error)
	CreateThoCap(ctx context.Context, arg CreateThoCapParams) (ThoCap, error)
	CreateTraiHuanLuyen(ctx context.Context, arg CreateTraiHuanLuyenParams) (TraiHuanLuyen, error)
	CreateUser(ctx context.Context, arg CreateUserParams) (User, error)
	DeleteBacHocByIDs(ctx context.Context, id string) error
	DeleteBhdByIDs(ctx context.Context, id string) error
	DeleteCapBacByID(ctx context.Context, id string) error
	DeleteDamNhiemCVBHDByIDAndYear(ctx context.Context, arg DeleteDamNhiemCVBHDByIDAndYearParams) error
	DeleteDamNhiemCVDVByIDAndYear(ctx context.Context, arg DeleteDamNhiemCVDVByIDAndYearParams) error
	DeleteDonViByID(ctx context.Context, donviID string) error
	DeleteDongGopBHDByIDAndYear(ctx context.Context, arg DeleteDongGopBHDByIDAndYearParams) error
	DeleteDongGopDVByIDAndYear(ctx context.Context, arg DeleteDongGopDVByIDAndYearParams) error
	DeleteHuynhTruongByID(ctx context.Context, huynhtruongID string) error
	DeleteKetKhoaTraiHLByIDAndDate(ctx context.Context, arg DeleteKetKhoaTraiHLByIDAndDateParams) error
	DeleteNgayTraiHuanLuyenByIDAndDate(ctx context.Context, arg DeleteNgayTraiHuanLuyenByIDAndDateParams) error
	DeleteNgayTuHocByIDAndDate(ctx context.Context, arg DeleteNgayTuHocByIDAndDateParams) error
	DeleteNienKhoaBacHocByIDAndYear(ctx context.Context, arg DeleteNienKhoaBacHocByIDAndYearParams) error
	DeleteNienKhoaTraiHuanLuyenByIDAndYear(ctx context.Context, arg DeleteNienKhoaTraiHuanLuyenByIDAndYearParams) error
	DeletePostByIDs(ctx context.Context, arg DeletePostByIDsParams) error
	DeleteQuestionByIDs(ctx context.Context, id int64) error
	DeleteResetsForUser(ctx context.Context, userID int64) error
	DeleteThiBacHocByIDAndDate(ctx context.Context, arg DeleteThiBacHocByIDAndDateParams) error
	DeleteThoCapByIDAndYear(ctx context.Context, arg DeleteThoCapByIDAndYearParams) error
	DeleteTraiHuanLuyenByID(ctx context.Context, id string) error
	FindAllCapBac(ctx context.Context) ([]CapBac, error)
	FindAllDamNhiemCVBHD(ctx context.Context) ([]DamNhiemCvBhd, error)
	FindAllDamNhiemCVDV(ctx context.Context) ([]DamNhiemCvDv, error)
	FindAllDonVi(ctx context.Context) ([]DonVi, error)
	FindAllDongGopBHD(ctx context.Context) ([]DongGopBhd, error)
	FindAllDongGopDV(ctx context.Context) ([]DongGopDv, error)
	FindAllHuynhTruong(ctx context.Context) ([]HuynhTruong, error)
	FindAllKetKhoaTraiHL(ctx context.Context) ([]KetKhoaTraiHl, error)
	FindAllNgayTraiHuanLuyen(ctx context.Context) ([]NgayTraiHuanLuyen, error)
	FindAllNgayTuHoc(ctx context.Context) ([]NgayTuHoc, error)
	FindAllNienKhoaBacHoc(ctx context.Context) ([]Nienkhoabachoc, error)
	FindAllNienKhoaTraiHuanLuyen(ctx context.Context) ([]Nienkhoatraihuanluyen, error)
	FindAllQuestions(ctx context.Context) ([]Question, error)
	FindAllThiBacHoc(ctx context.Context) ([]ThiBacHoc, error)
	FindAllThoCap(ctx context.Context) ([]ThoCap, error)
	FindAllTraiHuanLuyen(ctx context.Context) ([]TraiHuanLuyen, error)
	FindBacHoc(ctx context.Context) ([]BacHoc, error)
	FindBacHocByIDs(ctx context.Context, id string) (BacHoc, error)
	FindBhd(ctx context.Context) ([]Bhd, error)
	FindBhdByIDs(ctx context.Context, id string) (Bhd, error)
	FindCapBacByID(ctx context.Context, id string) (CapBac, error)
	FindDamNhiemCVBHDByIDAndYear(ctx context.Context, arg FindDamNhiemCVBHDByIDAndYearParams) (DamNhiemCvBhd, error)
	FindDamNhiemCVDVByIDAndYear(ctx context.Context, arg FindDamNhiemCVDVByIDAndYearParams) (DamNhiemCvDv, error)
	FindDonViByID(ctx context.Context, donviID string) (DonVi, error)
	FindDongGopBHDByIDAndYear(ctx context.Context, arg FindDongGopBHDByIDAndYearParams) (DongGopBhd, error)
	FindDongGopDVByIDAndYear(ctx context.Context, arg FindDongGopDVByIDAndYearParams) (DongGopDv, error)
	FindHuynhTruongByID(ctx context.Context, huynhtruongID string) (HuynhTruong, error)
	FindKetKhoaTraiHLByIDAndDate(ctx context.Context, arg FindKetKhoaTraiHLByIDAndDateParams) (KetKhoaTraiHl, error)
	FindNgayTraiHuanLuyenByIDAndDate(ctx context.Context, arg FindNgayTraiHuanLuyenByIDAndDateParams) (NgayTraiHuanLuyen, error)
	FindNgayTuHocByIDAndDate(ctx context.Context, arg FindNgayTuHocByIDAndDateParams) (NgayTuHoc, error)
	FindNienKhoaBacHocByIDAndYear(ctx context.Context, arg FindNienKhoaBacHocByIDAndYearParams) (Nienkhoabachoc, error)
	FindNienKhoaTraiHuanLuyenByIDAndYear(ctx context.Context, arg FindNienKhoaTraiHuanLuyenByIDAndYearParams) (Nienkhoatraihuanluyen, error)
	FindPostByIDs(ctx context.Context, arg FindPostByIDsParams) (Post, error)
	FindPostsByAuthor(ctx context.Context, authorID int64) ([]Post, error)
	FindQuestionByIDs(ctx context.Context, id int64) (Question, error)
	FindResetByCode(ctx context.Context, code string) (Reset, error)
	FindThiBacHocByIDAndDate(ctx context.Context, arg FindThiBacHocByIDAndDateParams) (ThiBacHoc, error)
	FindThoCapByIDAndYear(ctx context.Context, arg FindThoCapByIDAndYearParams) (ThoCap, error)
	FindTraiHuanLuyenByID(ctx context.Context, id string) (TraiHuanLuyen, error)
	FindUserByEmail(ctx context.Context, lower string) (User, error)
	FindUserByID(ctx context.Context, id int64) (User, error)
	FindUserByVerificationCode(ctx context.Context, verification string) (User, error)
	UpdateBacHoc(ctx context.Context, arg UpdateBacHocParams) (BacHoc, error)
	UpdateBhd(ctx context.Context, arg UpdateBhdParams) (Bhd, error)
	UpdateCapBac(ctx context.Context, arg UpdateCapBacParams) (CapBac, error)
	UpdateDamNhiemCVBHD(ctx context.Context, arg UpdateDamNhiemCVBHDParams) (DamNhiemCvBhd, error)
	UpdateDamNhiemCVDV(ctx context.Context, arg UpdateDamNhiemCVDVParams) (DamNhiemCvDv, error)
	UpdateDonVi(ctx context.Context, arg UpdateDonViParams) (DonVi, error)
	UpdateDongGopBHD(ctx context.Context, arg UpdateDongGopBHDParams) (DongGopBhd, error)
	UpdateDongGopDV(ctx context.Context, arg UpdateDongGopDVParams) (DongGopDv, error)
	UpdateHuynhTruong(ctx context.Context, arg UpdateHuynhTruongParams) (HuynhTruong, error)
	UpdateKetKhoaTraiHL(ctx context.Context, arg UpdateKetKhoaTraiHLParams) (KetKhoaTraiHl, error)
	UpdateNgayTraiHuanLuyen(ctx context.Context, arg UpdateNgayTraiHuanLuyenParams) (NgayTraiHuanLuyen, error)
	UpdateNgayTuHoc(ctx context.Context, arg UpdateNgayTuHocParams) (NgayTuHoc, error)
	UpdateNienKhoaBacHoc(ctx context.Context, arg UpdateNienKhoaBacHocParams) (Nienkhoabachoc, error)
	UpdateNienKhoaTraiHuanLuyen(ctx context.Context, arg UpdateNienKhoaTraiHuanLuyenParams) (Nienkhoatraihuanluyen, error)
	UpdatePost(ctx context.Context, arg UpdatePostParams) (Post, error)
	UpdateQuestion(ctx context.Context, arg UpdateQuestionParams) (Question, error)
	UpdateThiBacHoc(ctx context.Context, arg UpdateThiBacHocParams) (ThiBacHoc, error)
	UpdateThoCap(ctx context.Context, arg UpdateThoCapParams) (ThoCap, error)
	UpdateTraiHuanLuyen(ctx context.Context, arg UpdateTraiHuanLuyenParams) (TraiHuanLuyen, error)
	UpdateUserPassword(ctx context.Context, arg UpdateUserPasswordParams) error
	UpdateUserStatus(ctx context.Context, arg UpdateUserStatusParams) error
}

var _ Querier = (*Queries)(nil)
