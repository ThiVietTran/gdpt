// Code generated by MockGen. DO NOT EDIT.
// Source: db/wrapper/wrapper.go

// Package wrapper is a generated GoMock package.
package wrapper

import (
	context "context"
	reflect "reflect"

	gomock "github.com/golang/mock/gomock"
	db "github.com/karlkeefer/pngr/golang/db"
)

// MockQuerier is a mock of Querier interface.
type MockQuerier struct {
	ctrl     *gomock.Controller
	recorder *MockQuerierMockRecorder
}

// MockQuerierMockRecorder is the mock recorder for MockQuerier.
type MockQuerierMockRecorder struct {
	mock *MockQuerier
}

// NewMockQuerier creates a new mock instance.
func NewMockQuerier(ctrl *gomock.Controller) *MockQuerier {
	mock := &MockQuerier{ctrl: ctrl}
	mock.recorder = &MockQuerierMockRecorder{mock}
	return mock
}

// EXPECT returns an object that allows the caller to indicate expected use.
func (m *MockQuerier) EXPECT() *MockQuerierMockRecorder {
	return m.recorder
}

// CreatePost mocks base method.
func (m *MockQuerier) CreatePost(ctx context.Context, arg db.CreatePostParams) (db.Post, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "CreatePost", ctx, arg)
	ret0, _ := ret[0].(db.Post)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// CreatePost indicates an expected call of CreatePost.
func (mr *MockQuerierMockRecorder) CreatePost(ctx, arg interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "CreatePost", reflect.TypeOf((*MockQuerier)(nil).CreatePost), ctx, arg)
}

// CreateQuestion mocks base method.
func (m *MockQuerier) CreateQuestion(ctx context.Context, arg db.CreateQuestionParams) (db.Question, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "CreateQuestion", ctx, arg)
	ret0, _ := ret[0].(db.Question)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// CreateQuestion indicates an expected call of CreateQuestion.
func (mr *MockQuerierMockRecorder) CreateQuestion(ctx, arg interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "CreateQuestion", reflect.TypeOf((*MockQuerier)(nil).CreateQuestion), ctx, arg)
}

// CreateReset mocks base method.
func (m *MockQuerier) CreateReset(ctx context.Context, arg db.CreateResetParams) (db.Reset, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "CreateReset", ctx, arg)
	ret0, _ := ret[0].(db.Reset)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// CreateReset indicates an expected call of CreateReset.
func (mr *MockQuerierMockRecorder) CreateReset(ctx, arg interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "CreateReset", reflect.TypeOf((*MockQuerier)(nil).CreateReset), ctx, arg)
}

// CreateUser mocks base method.
func (m *MockQuerier) CreateUser(ctx context.Context, arg db.CreateUserParams) (db.User, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "CreateUser", ctx, arg)
	ret0, _ := ret[0].(db.User)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// CreateUser indicates an expected call of CreateUser.
func (mr *MockQuerierMockRecorder) CreateUser(ctx, arg interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "CreateUser", reflect.TypeOf((*MockQuerier)(nil).CreateUser), ctx, arg)
}

// DeletePostByIDs mocks base method.
func (m *MockQuerier) DeletePostByIDs(ctx context.Context, arg db.DeletePostByIDsParams) error {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "DeletePostByIDs", ctx, arg)
	ret0, _ := ret[0].(error)
	return ret0
}

// DeletePostByIDs indicates an expected call of DeletePostByIDs.
func (mr *MockQuerierMockRecorder) DeletePostByIDs(ctx, arg interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "DeletePostByIDs", reflect.TypeOf((*MockQuerier)(nil).DeletePostByIDs), ctx, arg)
}

// DeleteQuestionByIDs mocks base method.
func (m *MockQuerier) DeleteQuestionByIDs(ctx context.Context, id int64) error {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "DeleteQuestionByIDs", ctx, id)
	ret0, _ := ret[0].(error)
	return ret0
}

// DeleteQuestionByIDs indicates an expected call of DeleteQuestionByIDs.
func (mr *MockQuerierMockRecorder) DeleteQuestionByIDs(ctx, id interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "DeleteQuestionByIDs", reflect.TypeOf((*MockQuerier)(nil).DeleteQuestionByIDs), ctx, id)
}

// DeleteResetsForUser mocks base method.
func (m *MockQuerier) DeleteResetsForUser(ctx context.Context, userID int64) error {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "DeleteResetsForUser", ctx, userID)
	ret0, _ := ret[0].(error)
	return ret0
}

// DeleteResetsForUser indicates an expected call of DeleteResetsForUser.
func (mr *MockQuerierMockRecorder) DeleteResetsForUser(ctx, userID interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "DeleteResetsForUser", reflect.TypeOf((*MockQuerier)(nil).DeleteResetsForUser), ctx, userID)
}

// FindAllQuestions mocks base method.
func (m *MockQuerier) FindAllQuestions(ctx context.Context) ([]db.Question, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "FindAllQuestions", ctx)
	ret0, _ := ret[0].([]db.Question)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// FindAllQuestions indicates an expected call of FindAllQuestions.
func (mr *MockQuerierMockRecorder) FindAllQuestions(ctx interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "FindAllQuestions", reflect.TypeOf((*MockQuerier)(nil).FindAllQuestions), ctx)
}

// FindPostByIDs mocks base method.
func (m *MockQuerier) FindPostByIDs(ctx context.Context, arg db.FindPostByIDsParams) (db.Post, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "FindPostByIDs", ctx, arg)
	ret0, _ := ret[0].(db.Post)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// FindPostByIDs indicates an expected call of FindPostByIDs.
func (mr *MockQuerierMockRecorder) FindPostByIDs(ctx, arg interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "FindPostByIDs", reflect.TypeOf((*MockQuerier)(nil).FindPostByIDs), ctx, arg)
}

// FindPostsByAuthor mocks base method.
func (m *MockQuerier) FindPostsByAuthor(ctx context.Context, authorID int64) ([]db.Post, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "FindPostsByAuthor", ctx, authorID)
	ret0, _ := ret[0].([]db.Post)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// FindPostsByAuthor indicates an expected call of FindPostsByAuthor.
func (mr *MockQuerierMockRecorder) FindPostsByAuthor(ctx, authorID interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "FindPostsByAuthor", reflect.TypeOf((*MockQuerier)(nil).FindPostsByAuthor), ctx, authorID)
}

// FindQuestionByIDs mocks base method.
func (m *MockQuerier) FindQuestionByIDs(ctx context.Context, id int64) (db.Question, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "FindQuestionByIDs", ctx, id)
	ret0, _ := ret[0].(db.Question)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// FindQuestionByIDs indicates an expected call of FindQuestionByIDs.
func (mr *MockQuerierMockRecorder) FindQuestionByIDs(ctx, id interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "FindQuestionByIDs", reflect.TypeOf((*MockQuerier)(nil).FindQuestionByIDs), ctx, id)
}

// FindResetByCode mocks base method.
func (m *MockQuerier) FindResetByCode(ctx context.Context, code string) (db.Reset, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "FindResetByCode", ctx, code)
	ret0, _ := ret[0].(db.Reset)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// FindResetByCode indicates an expected call of FindResetByCode.
func (mr *MockQuerierMockRecorder) FindResetByCode(ctx, code interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "FindResetByCode", reflect.TypeOf((*MockQuerier)(nil).FindResetByCode), ctx, code)
}

// FindUserByEmail mocks base method.
func (m *MockQuerier) FindUserByEmail(ctx context.Context, lower string) (db.User, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "FindUserByEmail", ctx, lower)
	ret0, _ := ret[0].(db.User)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// FindUserByEmail indicates an expected call of FindUserByEmail.
func (mr *MockQuerierMockRecorder) FindUserByEmail(ctx, lower interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "FindUserByEmail", reflect.TypeOf((*MockQuerier)(nil).FindUserByEmail), ctx, lower)
}

// FindUserByID mocks base method.
func (m *MockQuerier) FindUserByID(ctx context.Context, id int64) (db.User, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "FindUserByID", ctx, id)
	ret0, _ := ret[0].(db.User)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// FindUserByID indicates an expected call of FindUserByID.
func (mr *MockQuerierMockRecorder) FindUserByID(ctx, id interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "FindUserByID", reflect.TypeOf((*MockQuerier)(nil).FindUserByID), ctx, id)
}

// FindUserByVerificationCode mocks base method.
func (m *MockQuerier) FindUserByVerificationCode(ctx context.Context, verification string) (db.User, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "FindUserByVerificationCode", ctx, verification)
	ret0, _ := ret[0].(db.User)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// FindUserByVerificationCode indicates an expected call of FindUserByVerificationCode.
func (mr *MockQuerierMockRecorder) FindUserByVerificationCode(ctx, verification interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "FindUserByVerificationCode", reflect.TypeOf((*MockQuerier)(nil).FindUserByVerificationCode), ctx, verification)
}

// UpdatePost mocks base method.
func (m *MockQuerier) UpdatePost(ctx context.Context, arg db.UpdatePostParams) (db.Post, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "UpdatePost", ctx, arg)
	ret0, _ := ret[0].(db.Post)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// UpdatePost indicates an expected call of UpdatePost.
func (mr *MockQuerierMockRecorder) UpdatePost(ctx, arg interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "UpdatePost", reflect.TypeOf((*MockQuerier)(nil).UpdatePost), ctx, arg)
}

// UpdateQuestion mocks base method.
func (m *MockQuerier) UpdateQuestion(ctx context.Context, arg db.UpdateQuestionParams) (db.Question, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "UpdateQuestion", ctx, arg)
	ret0, _ := ret[0].(db.Question)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// UpdateQuestion indicates an expected call of UpdateQuestion.
func (mr *MockQuerierMockRecorder) UpdateQuestion(ctx, arg interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "UpdateQuestion", reflect.TypeOf((*MockQuerier)(nil).UpdateQuestion), ctx, arg)
}

// UpdateUserPassword mocks base method.
func (m *MockQuerier) UpdateUserPassword(ctx context.Context, arg db.UpdateUserPasswordParams) error {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "UpdateUserPassword", ctx, arg)
	ret0, _ := ret[0].(error)
	return ret0
}

// UpdateUserPassword indicates an expected call of UpdateUserPassword.
func (mr *MockQuerierMockRecorder) UpdateUserPassword(ctx, arg interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "UpdateUserPassword", reflect.TypeOf((*MockQuerier)(nil).UpdateUserPassword), ctx, arg)
}

// UpdateUserStatus mocks base method.
func (m *MockQuerier) UpdateUserStatus(ctx context.Context, arg db.UpdateUserStatusParams) error {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "UpdateUserStatus", ctx, arg)
	ret0, _ := ret[0].(error)
	return ret0
}

// UpdateUserStatus indicates an expected call of UpdateUserStatus.
func (mr *MockQuerierMockRecorder) UpdateUserStatus(ctx, arg interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "UpdateUserStatus", reflect.TypeOf((*MockQuerier)(nil).UpdateUserStatus), ctx, arg)
}

// WithTx mocks base method.
func (m *MockQuerier) WithTx(arg0 context.Context, arg1 func(db.Querier) error) error {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "WithTx", arg0, arg1)
	ret0, _ := ret[0].(error)
	return ret0
}

// WithTx indicates an expected call of WithTx.
func (mr *MockQuerierMockRecorder) WithTx(arg0, arg1 interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "WithTx", reflect.TypeOf((*MockQuerier)(nil).WithTx), arg0, arg1)
}
