# SRTgo: K-Train (KTX, SRT) Reservation Assistant
[![Upload Python Package](https://github.com/lapis42/srtgo/actions/workflows/python-publish.yml/badge.svg)](https://github.com/lapis42/srtgo/actions/workflows/python-publish.yml)
[![Downloads](https://static.pepy.tech/badge/srtgo)](https://pepy.tech/project/srtgo)
[![Downloads](https://static.pepy.tech/badge/srtgo/month)](https://pepy.tech/project/srtgo)
[![Python version](https://img.shields.io/pypi/pyversions/srtgo)](https://pypistats.org/packages/srtgo)

> [!NOTE]
> 공정한 예매 문화 조성을 위해 본 프로젝트의 개발 및 지원을 중단하기로 결정했습니다. 양해 부탁드립니다.

> [!WARNING]
> 본 프로그램의 모든 상업적, 영리적 이용을 엄격히 금지합니다. 본 프로그램 사용에 따른 민형사상 책임을 포함한 모든 책임은 사용자에게 있으며, 본 프로그램의 개발자는 민형사상 책임을 포함한 어떠한 책임도 부담하지 않습니다. 본 프로그램을 내려받음으로써 모든 사용자는 위 사항에 이의 없이 동의하는 것으로 간주됩니다.

> [!IMPORTANT]
> 본 프로그램에 입력하는 아이디, 비밀번호, 카드번호, 예매 설정 등은 로컬 컴퓨터에 [keyring 모듈](https://pypi.org/project/keyring/)을 통하여 저장하며 그 이외의 위치에 네트워크 전송 등을 통하여 공유되지 않습니다.

## 주요 기능
- SRT 및 KTX 기차표 자동 예매
- 예매 확인, 결제, 취소
- 텔레그램 알림 전송
  - [Bot Token 및 Chat ID 얻기](https://gabrielkim.tistory.com/entry/Telegram-Bot-Token-%EB%B0%8F-Chat-Id-%EC%96%BB%EA%B8%B0)
- 자동 신용카드 결제
- 자주 사용하는 역 설정 및 직접 수정
- 어린이, 경로우대, 장애인 승객 옵션
- KTX 검색 시 KTX 열차만 조회하는 옵션
- 인접역 포함 조회 옵션
- SRT 통합조회 제외 옵션 (서울/용산-수서 등 함께 보기 끄기)
- 매진 시 예약대기 신청

---

> [!NOTE]
> I have decided to discontinue the development and support for this project. Thank you for your understanding.

> [!WARNING]
> All commercial and profit-making use of this program is strictly prohibited. Use of this program is at your own risk, and the developers of this program shall not be liable for any liability, including civil or criminal liability. By downloading this program, all users are deemed to agree to the above terms without any objection.

> [!IMPORTANT]
> All sensitive data, including login, payment info, and settings, is stored locally via [keyring](https://pypi.org/project/keyring/) and never transmitted elsewhere by SRTgo.

## Key Features
- Automated SRT/KTX ticket reservations
- Reservation lookup, payment, and cancellation
- Telegram notifications
- Automatic credit card payment
- Favorite station presets and direct station editing
- Child, senior, and disabled passenger options
- KTX-only train search option
- Adjacent station search option
- Option to exclude integrated SRT search (turn off showing Seoul/Yongsan and Suseo departures together)
- Waitlist for sold-out trains

## Installation / Update
```bash
pip install srtgo -U
```

Install the latest GitHub version:

```bash
pip install git+https://github.com/lapis42/srtgo -U
```

Install from a local checkout:

```bash
git clone https://github.com/lapis42/srtgo
cd srtgo
pip install .
```

## Using SRTgo
Run the interactive CLI:

```bash
srtgo
```

Debug mode:

```bash
srtgo --debug
```

## Menu
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

## Initial Setup
Use `로그인 설정` before the first reservation.

```text
[?] 열차 선택 (↕:이동, Enter: 선택, Ctrl-C: 취소): SRT
 > SRT
   KTX
   취소

[?] SRT 계정 아이디 (멤버십 번호, 이메일, 전화번호):
[?] SRT 계정 패스워드:
```

You can also provide login credentials through environment variables. If both
variables for a rail type are set, SRTgo uses them before keyring and does not
save them back to keyring.

```bash
export KSKILL_SRT_ID="your-srt-id"
export KSKILL_SRT_PASSWORD="your-srt-password"

export KSKILL_KTX_ID="your-korail-id"
export KSKILL_KTX_PASSWORD="your-korail-password"
```

Environment variables are convenient for temporary or headless runs, but they
can be exposed through shell history, process environments, terminal logs, or
automation systems. Use keyring for regular local use.

Optional settings:

- `텔레그램 설정`: save Telegram bot token and chat ID, then receive reservation notifications.
- `카드 설정`: save card number, first two digits of card password, birth date or business registration number, and expiration date for automatic payment.
- `역 설정`: choose favorite stations from the built-in station list.
- `역 직접 수정`: enter stations directly, for example `수서,대전,동대구`.
- `예매 옵션 설정`: enable passenger options, KTX-only search, and adjacent station search.

```text
[?] 예매 옵션 선택 (Space: 선택, Enter: 완료, Ctrl-A: 전체선택, Ctrl-R: 선택해제, Ctrl-C: 취소)
 > [ ] 어린이
   [ ] 경로우대
   [ ] 중증장애인
   [ ] 경증장애인
   [ ] KTX만
   [ ] 인접역 포함 조회
   [ ] SRT 통합조회 제외 (서울/용산-수서 등 함께 보기 끄기)
```

KTX 열차 조회에는 코레일+ 앱과 동일하게 두 가지 독립적인 옵션이 있습니다.
- `인접역 포함 조회`: 검색 역 근처의 다른 역(예: 서울-서대전 조회 시 용산-서대전)도 시간순으로 함께 보여줍니다.
- `SRT 통합조회 제외`: 기본적으로 KTX 검색에는 SRT 열차(수서 등 출발)가 함께 조회되는데, 이 옵션을 켜면 SRT를 제외하고 순수 KTX 열차만 조회합니다.

두 옵션을 함께 켜면(기본값인 SRT 통합조회 유지 + 인접역 포함 조회 켜기) 서울/용산 조회 시 수서 출발 열차까지 인접역으로 함께 표시됩니다.

## Reservation Flow
Choose `예매 시작`, then select `SRT` or `KTX`.

```text
[?] 열차 선택 (↕:이동, Enter: 선택, Ctrl-C: 취소): SRT
 > SRT
   KTX
   취소

[?] 출발역 선택 (↕:이동, Enter: 선택, Ctrl-C: 취소): 수서
 > 수서
   대전
   동대구
   부산

[?] 도착역 선택 (↕:이동, Enter: 선택, Ctrl-C: 취소): 동대구
   수서
   대전
 > 동대구
   부산

[?] 출발 날짜 선택 (↕:이동, Enter: 선택, Ctrl-C: 취소): 2024/01/04 Thu
   2024/01/03 Wed
 > 2024/01/04 Thu
   2024/01/05 Fri
   2024/01/06 Sat

[?] 출발 시각 선택 (↕:이동, Enter: 선택, Ctrl-C: 취소): 10
   00
   01
   02
   03
   04
   05
   06
   07
   08
   09
 > 10
   11
   12

[?] 성인 승객수 (↕:이동, Enter: 선택, Ctrl-C: 취소): 1
 > 1
   2
   3
   4
   5
   6
   7
   8
   9
```

If passenger options are enabled, SRTgo also asks for the selected passenger counts:

```text
[?] 어린이 승객수 (↕:이동, Enter: 선택, Ctrl-C: 취소): 0
[?] 경로우대 승객수 (↕:이동, Enter: 선택, Ctrl-C: 취소): 0
[?] 중증장애인 승객수 (↕:이동, Enter: 선택, Ctrl-C: 취소): 0
[?] 경증장애인 승객수 (↕:이동, Enter: 선택, Ctrl-C: 취소): 0
```

Select one or more trains with `Space`, then press `Enter`.

```text
[?] 예약할 열차 선택 (↕:이동, Space: 선택, Enter: 완료, Ctrl-A: 전체선택, Ctrl-R: 선택해제, Ctrl-C: 취소):
   [ ] [SRT 323] 01/04 10:00~11:40  수서~동대구  특실 매진, 일반실 매진, 예약대기 매진
   [X] [SRT 335] 01/04 13:00~14:46  수서~동대구  특실 매진, 일반실 가능, 예약대기 매진
   [ ] [SRT 339] 01/04 13:55~15:25  수서~동대구  특실 매진, 일반실 가능, 예약대기 매진
```

Choose a seat preference and whether to pay by card immediately after reservation.

```text
[?] 선택 유형 (↕:이동, Enter: 완료, Ctrl-C: 취소): 일반실 우선
 > 일반실 우선
   일반실만
   특실 우선
   특실만

[?] 예매 시 카드 결제 (y/N): N
```

SRTgo keeps checking the selected trains until a seat or waitlist is available.

```text
예매 대기 중... |   16 (00:00:15)

🎫 🎉 예매 성공!!! 🎉 🎫
[SRT] 01월 04일, 수서~동대구(13:00~14:46) 36800원(1석), 구입기한 01월 03일 16:57
8호차 5B (일반실) 어른/청소년 [36800원(700원 할인)]
```

## Reservation Lookup / Payment / Cancellation
Choose `예매 확인/결제/취소`, then select `SRT` or `KTX`.

```text
[?] 메뉴 선택 (↕:이동, Enter: 선택): 예매 확인/결제/취소
   예매 시작
 > 예매 확인/결제/취소
   로그인 설정
   텔레그램 설정
   카드 설정
   역 설정
   역 직접 수정
   예매 옵션 설정
   나가기

[?] 열차 선택 (↕:이동, Enter: 선택, Ctrl-C: 취소): SRT
 > SRT
   KTX
   취소

[?] 예약 취소 (Enter: 결정): [SRT] 01월 04일, 수서~동대구(13:00~14:46) 36800원(1석), 구입기한 01월 03일 16:57
 > [SRT] 01월 04일, 수서~동대구(13:00~14:46) 36800원(1석), 구입기한 01월 03일 16:57
   텔레그램으로 예매 정보 전송
   돌아가기
```

If the selected item is an unpaid reservation, SRTgo asks whether to pay or cancel it.

```text
[?] 결재 대기 승차권: [SRT] 01월 04일, 수서~동대구(13:00~14:46) 36800원(1석), 구입기한 01월 03일 16:57
 > 결제하기
   취소하기
```

## Notes
- Reservation dates are generated from the current time plus 10 minutes.
- SRT date choices are available up to D-30 after 07:00, otherwise D-29.
- KTX date choices are available up to D-31 after 07:00, otherwise D-30.
- Passenger count must be at least 1 and less than 10.
- For same-day reservations, if the selected time is earlier than the current time plus 10 minutes, SRTgo searches from the adjusted current time.

## Acknowledgments
- This project includes code from [SRT](https://github.com/ryanking13/SRT) by ryanking13, licensed under the MIT License, and [korail2](https://github.com/carpedm20/korail2) by carpedm20, licensed under the BSD License.
