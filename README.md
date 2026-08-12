# ktxgo: K-Train Reservation Assistant

[![Python version](https://img.shields.io/pypi/pyversions/ktxgo)](https://pypi.org/project/ktxgo/)

> [!NOTE]
> 공정한 예매 문화 조성을 위해 본 프로젝트의 개발 및 지원을 중단하기로 결정했습니다. 양해 부탁드립니다.

> [!WARNING]
> 본 프로그램의 모든 상업적·영리적 이용을 엄격히 금지합니다. 본 프로그램 사용에 따른 모든 책임은 사용자에게 있습니다.

> [!IMPORTANT]
> 아이디, 비밀번호, 카드번호, 예매 설정 등은 로컬 컴퓨터에 [keyring 모듈](https://pypi.org/project/keyring/)을 통해 저장됩니다.

## 주요 기능

- KTX 열차표 자동 예매
- 예매 확인, 결제, 취소
- 텔레그램 알림
- 자동 신용카드 결제
- 자주 사용하는 역 설정 및 직접 수정
- 어린이, 경로우대, 장애인 승객 옵션
- 매진 시 예약대기 신청

## 설치

```bash
pip install ktxgo -U
```

GitHub 최신 버전을 설치하려면 다음 명령을 실행합니다.

```bash
pip install git+https://github.com/qrid/ktxgo -U
```

로컬 체크아웃에서 설치하려면 다음 명령을 실행합니다.

```bash
git clone https://github.com/qrid/ktxgo
cd ktxgo
pip install .
```

## 사용법

대화형 CLI를 실행합니다.

```bash
ktxgo
```

디버그 모드:

```bash
ktxgo --debug
```

처음 실행하면 `로그인 설정`에서 계정을 등록합니다. 환경 변수로 로그인 정보를 전달할 수도 있습니다.

```bash
export KSKILL_KTX_ID="your-korail-id"
export KSKILL_KTX_PASSWORD="your-korail-password"
```

환경 변수는 셸 기록, 프로세스 환경, 터미널 로그에 노출될 수 있으므로 일반적인 사용에는 keyring을 권장합니다.

## 메뉴

```text
[?] 메뉴 선택 (↕:이동, Enter: 선택): 예매 시작
 > 예매 시작
   예매 확인/결제/취소
   로그인 설정
   텔레그램 설정
   카드 설정
   역 설정
   역 직접 수정
   예매 옵션 설정
   나가기
```

`예매 옵션 설정`에서 승객 유형과 검색 옵션을 선택할 수 있습니다. `역 설정`에서는 자주 사용하는 역을 고르고, `역 직접 수정`에서는 `수서,대전,동대구`처럼 역을 직접 입력할 수 있습니다.

## 주의사항

- 예매 날짜는 현재 시각에 10분을 더한 시점부터 생성됩니다.
- 승객 수는 1명 이상 10명 미만이어야 합니다.
- 같은 날의 출발 시각이 현재 시각보다 이르면 자동으로 가능한 시각부터 검색합니다.

## 라이선스 및 감사의 글

MIT License. 자세한 내용은 [LICENSE](LICENSE) 파일을 참고하세요.

이 프로젝트는 [korail2](https://github.com/carpedm20/korail2)의 코드를 포함하며 BSD License를 따릅니다.
