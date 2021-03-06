--
--DCL
--
--CREATE
--ALTER
--DROP

--System 계정으로 수행

--사용자 생성: CREATE USER
CREATE USER C##bituser IDENTIFIED BY bituser;

--sqplus
--사용자 삭제 : DROP USER
DROP USER C##bituser CASCADE;

--다시 생성
CREATE USER C##bituser IDENTIFIED BY bituser;

--사용자 정보 확인
--USER : 현재 사용자 관련
--ALL : 전체의 객체
--DBA : DBA 전용. 객체의 모든 정보
SELECT * FROM USER_USERS;
SELECT * FROM ALL_USERS;
SELECT * FROM DBA_USERS; -- DBA내의 모든 USER

-- 새로 만든 사용자 확인
SELECT * FROM DBA_USERS WHERE username = 'C##BITUSER';

-- 권한(privilage)과 역할(ROLE)
-- 특정 작업 수행을 위해 적절한 권한을 가져야 한다.
-- CRATE SESSION 있어야 로그인 된다

-- 시스템 권한의 부여 : GRANT 권한 TO 사용자
-- C##BITUSER에게 create session 권한을 부여

GRANT create session TO C##BITUSER;

--일반적으로 CONNECT, RESOURCE 롤을 부여하면 일반사용자의 역할 수행 가능
GRANT connect, resource TO C##BITUSER;

-- ORACLE 12 이후로는 임의로 TABLESPACE를 할당 해 줘야 한다.
ALTER USER C##BITUSER -- 사용자 정보 수정
DEFAULT TABLESPACE USERS -- 기본 테이블 스페이스를 USERS 에 지정
QUOTA UNLIMITED ON USERS -- 사용 용량 지정

--객체 권한 부여
--C##BITUSER 사용자에게 HR.EMPLOYEES를 SELECT 할 수 있는 권한 부여
GRANT select ON HR.EMPLOYEES TO C##BITUSER;

--객체 권한 회수
REVOKE select ON HR.EMPLOYEES FROM C##BITUSER;
GRANT select ON HR.EMPLOYEES TO C##BITUSER;
-- 전체 권한 부여시
-- GRANT all privilages...
