# 하요 요리 서버 위키

운영진이 마크다운으로 글을 쓰면, 플레이어가 보는 웹사이트가 되는 구조입니다.
플레이어는 **읽기만** 하고, 편집은 이 저장소에 접근할 수 있는 운영진만 합니다.

## 글을 고치는 법

`docs/` 안의 `.md` 파일을 고치면 그게 그대로 웹페이지입니다.

| 파일 | 웹페이지 주소 |
|---|---|
| `docs/index.md` | `/` (홈) |
| `docs/cooking/recipes.md` | `/cooking/recipes/` |
| `docs/items/return-stone.md` | `/items/return-stone/` |

**파일을 새로 만들었다면** `mkdocs.yml` 아래쪽 `nav:` 에도 한 줄 추가해야 메뉴에 나옵니다.
(추가하지 않으면 빌드는 되지만 메뉴에서 찾을 수 없습니다.)

## 고친 걸 확인하는 법

`미리보기.bat` 을 더블클릭하면 브라우저에서 바로 볼 수 있습니다.
파일을 저장할 때마다 화면이 자동으로 새로고침됩니다.

명령어로 하려면:

```bash
pip install -r requirements.txt
mkdocs serve
```

## 실제 사이트에 올리는 법

`main` 브랜치에 push 하면 GitHub Actions 가 알아서 빌드해서 올립니다. 1~2분쯤 걸립니다.

```bash
git add .
git commit -m "레시피 페이지 수정"
git push
```

### 처음 한 번만 해야 하는 설정

1. GitHub 에 저장소를 만들고 이 폴더를 push 합니다.
2. 저장소 **Settings → Pages → Source** 를 **GitHub Actions** 로 바꿉니다.
3. 사이트 주소는 `mkdocs.yml` 에 이미 설정되어 있습니다.

   ```yaml
   site_url: https://aca-kor-team.github.io/hayo-wiki/
   ```

   > `site_url` 의 맨 뒤 경로는 **저장소 이름과 같아야** 합니다.
   > 저장소 이름을 바꾸면 이 줄도 함께 고쳐야 합니다.
> **주의:** 이 위키는 시청자도 볼 수 있는 공개 문서입니다.
> 참가자 전용 디스코드 초대 링크는 어떤 페이지에도 넣지 마세요.

## 이미지 · GIF 넣기

[이미지_넣는_법.md](이미지_넣는_법.md) 를 봐주세요.
`docs/assets/` 아래 주제별 폴더에 넣으면 됩니다.

## 폴더 구조

```
aca-wiki/
├─ mkdocs.yml           ← 사이트 설정, 메뉴 구성
├─ requirements.txt     ← 필요한 프로그램 목록
├─ 미리보기.bat          ← 더블클릭하면 로컬 미리보기
├─ docs/                ← 여기 있는 .md 가 웹페이지가 됩니다
│  ├─ index.md
│  ├─ start/            처음 오셨나요?
│  ├─ cooking/          요리 시스템
│  ├─ items/            아이템
│  ├─ reference/        명령어 · FAQ
│  ├─ assets/           ← 이미지 · GIF 를 여기에
│  └─ stylesheets/      디자인 손볼 때
└─ .github/workflows/   자동 배포 설정
```

## 자주 쓰는 문법

````markdown
!!! warning "제목"
    강조하고 싶은 내용

??? question "눌러야 펼쳐지는 항목"
    답변 내용

| 표 | 만들기 |
|---|---|
| 칸 | 칸 |

![이미지 설명](../assets/cooking/사진.png)

[다른 문서로 링크](../items/return-stone.md)
````

인게임 채팅 메시지를 그대로 보여줄 때:

```html
<div class="mc-chat">■ 아직 배우지 않은 레시피입니다!</div>
```

`green` `yellow` `gray` 를 덧붙이면 색이 바뀝니다. (`class="mc-chat green"`)
