# 뉴스를 요약해주는 "3분-뉴스" : 뉴스 본문 요약서비스!
<img src="https://github.com/kbs4674/news-summary/blob/master/app/assets/images/logo.png?raw=true" width="300px">

## 팀원
#### 김철민, 문지혜, 이동현, 김태현
#### Special Thanks to. 디자이너 멘토님 (배너 그림 도움)
★ 장려상(4등) 수상 ★<br/>
<!-- <img src="https://github.com/kbs4674/news-summary/blob/master/public/DKU_victory.png?raw=true" width="600px"> -->


## 1. INFO
[![IMAGE ALT TEXT HERE](http://img.youtube.com/vi/XbJwVf-J9js/0.jpg)](https://youtu.be/XbJwVf-J9js)<br/>
▲ 뉴스 본문 요약서비스 시연영상 (클릭 시 Youtube 영상이 재생됩니다.)

#### 단국대학교 소확행 해커톤
<img src="https://github.com/kbs4674/news-summary/blob/master/public/hackathone_poster.png?raw=true" width="250px">

#### [DEMO] https://news-bot-kr.herokuapp.com/

## 2. 루비/루비온 레일즈 정보
* Ruby : 2.4.0
* Rails : 5.1.7


## 3. 프로젝트 개요
#### [발표자료] 파워포인트 <a href="/public/PPT_8_Team.pptx?raw=true">[클릭]</a>
1. 요즘 청소년 ~ 청년층 들은 뉴스를 잘 접하지 않는다.
2. 그나마 젊은층이 인터넷을 하면서 네이버를 많이 접하곤 하는데, 네이버 메인에 뉴스가 보이다보니 그나마 익숙한 접근방법이 존재해왔으나, 최근에 네이버 메인 디자인 변경(개선된 디자인에는 메인에 뉴스가 안보임.)으로 인해 이 뉴스접근 방법 마저도 사라졌다.
3. 뉴스는 너무 길다보니 스크롤 압박으로 읽기 귀찮아 하는 사람이 있다.

*  그래서 이렇게 했다.
1. 뉴스의 본문을 요약시켜서 그나마 굵직한것만 캣치해서 빨리 볼 수 있게 하자.
2. 우리 컨텐츠의 접근성을 높여보고자, 카카오 BOT을 개발했다.
3. 뉴스가 보통 딱딱한 이미지이다 보니, 조금이나마 친근한 분위기로 접근하고자 귀엽고 부드러운 디자인으로 컨셉을 잡았다. (이는 MBC 마스코트에서 영감을 얻었다.)


* 사이트의 접근층 마련
1. 가짜뉴스 게시판을 제작해가지고 사용자들끼리 재미있게 놀 수 있는 놀이판을 마련했다.
    가짜뉴스 예시 : 김모씨(26) 기말고사 시험공부 잠을 이기지 못하고, 결국 시험을 치르지 못해 F 낙제를 받아... "충격!!"
2 때론 이 가짜뉴스 게시판이 아고라의 현장으로 만드는 여론의 장으로 만들 수 있다.
    * 이런 게시글이라면 아고라로?
        "충격! ○○회사 대리 김모씨, 지하철에서 노인폭행!! 실화!?" (이런 경우 반드시 증거사진도 함꼐 첨부)
    * 혹시나 모를 찌라시, 소란을 대비해 게시글 마다 작성자의 IP주소도 적혀있게 함.


## 4. 사이트 시스템 흐름도 설명
<img src="https://github.com/kbs4674/news-summary/blob/master/public/work_process.png?raw=true" width="700px">


## 5. 핵심 코드파일
1. ```app/controllers/homes_controller.rb``` [<a href="/app/controllers/homes_controller.rb">이동</a>] 뉴스 게시물 및 Fake News 게시물 관련 DB 제어
2. ```app/views/homes``` [<a href="/app/views/homes">이동</a>] 뉴스, Fake News 페이지를 보여주는 View
3. ```lib/tasks/news_main.rake``` [<a href="/lib/tasks/news_main.rake">이동</a>] 네이버에서 오늘의 메인뉴스 크롤링 및 3줄로 요약
    * 오늘의 뉴스 크롤링 좌표 : https://news.naver.com/
    * 3줄요약 : https://summariz3.herokuapp.com 사이트에 네이버에서 수집한 뉴스 내용을 전송시키고, 결과값(3줄 요약)을 가져온 뒤 우리 DB에 저장시킴.
4. ```KAKAO-BOT/kakao-bot.js``` [<a href="/KAKAO-BOT/kakao-bot.js">이동</a>] 카카오봇 코드

## 6. Ruby on Rails 프로젝트 생성
* 첫 레일즈 셋팅 (C9에서 Ruby on Rails Tutorial 프로젝트를 선택하세요.)
    * 공개버전 Github에서는 API 관련 등 계정 정보가 담긴 ```application.yml``` 파일이 없습니다.
```
git init
rm -rf README.md
git remote add origin https://github.com/kbs4674/rails_base
git pull origin master
gem install rails --version=5.1.6
bundle install
rake db:drop;rake db:migrate;rake db:seed
rails s -b $IP -p $PORT
```
* 혹시 AWS에서 프로젝트를 생성 할 경우 ```bundle install``` 전에 다음 명령어를 추가적으로 입력해주세요.
```
sudo su
yum install -y postgresql95 postgresql95-server postgresql95-libs postgresql95-contrib postgresql95-devel
exit
bundle install
```
* <b>AWS 기준</b> 서버 설정법은 다음 과정을 따라주길 바랍니다.
    * <a href="https://blog.naver.com/kbs4674/221168996150" target="_blank">```https://blog.naver.com/kbs4674/221168996150```</a>
* <b>Heroku</b> 서버 셋팅은 <a href="http://wantknow.tistory.com/61" target="_blank"><b>여기</b></a>를 참고 바랍니다.
* <b>development 환경</b>에서 ```rake db:drop``` 시 오류가 나오는 것은 "정상"입니다.
    * production 모드에서 설정한 PostgreSQL DB 설정 때문이며, 정상 drop 됩니다.
* <b>Heroku</b> 서버 설정 시, ```database.yml``` 파일을 수정해주세요.
* <b>Heroku</b> 에 Deploy 때, <b>You must use Bundler 2 or greater with this lockfile</b> 오류 발생 시,
```heroku login``` 및 ```git remote heroku ...``` 후,  ```heroku buildpacks:set https://github.com/bundler/heroku-buildpack-bundler2``` 명령어를 입력해주세요.


## 7. Ruby on Rails 간단 이론 설명
* 이론
    * Ruby on Rails은 Ruby 기반의 웹 프레임워크임. (Python의 Django 혹은 Java의 Spring 같은 개념)
    * Ruby on Rails은 MVC 패턴으로 이루어져 있으며, 디자인 작업은 보통 V(View)에서 이루어짐
        * M : Model(DB 및 DB 관계를 다룸) / V : View (페이지를 다루며, HTML/CSS/Javascript/Rails 코드와 병합되어 사용) / C : Controller (DB를 어떻게 처리할건지 관리)
        * 디자인을 할 땐 M, C를 고려할 것 없이 V만 신경쓰면 될 것임.
    * Javascript, CSS는 ```app/assets/javascript``` 혹은 ```app/assets/stylesheets```에 넣어두면 됨.
        * ```<script src="...">``` 혹은 ```<link rel="...">```을 정의하지 않아도 알아서 적용됨.
        * 캐싱에 영향을 안받음. (F12로 보면 파일 이름 뒤에 난수가 붙는걸 확인 가능)
    * ```<%= ... %>``` 혹은 ```<% ... %>```은 레일즈 코드임.
    * ```<%= render '...' %>```은 ```'...'``` 위치의 View를 불러오는 역할을 맡음 (Default : ```app/views/```)
    * 모든 View에 있어 공통적으로 보여지는 View(예 : 상단 메뉴, 기본 글꼴 style) ```app/views/layouts/application.html.erb``` 
    * 홈페이지 View 코드 수정은 ```app/views/(모델명)``` 에서 이루어짐.<br/><br/>
    * Ruby on Rails에는 크게 3가지 모드가 존재함 : Development, Test, Production
        * Development : 주로 개발용 모드로서 오류를 일으킬 시 오류메세지 및 디버그를 알려줌.
        * Production : 서비스를 릴리즈할 때 쓰이는 모드로서, 링크를 잘못 입력하거나 오류 발생 시 404 에러페이지 혹은 500 에러페이지로 리다이렉트 시킴.
            * 404 혹은 500 페이지 view는 ```public``` 폴더 안에 있음.

* 명령어 및 위치 모음
    * 서버 ON 명령어 : ```rails s -b $IP -p $PORT```
    * DB추가, 애트리뷰트 추가 등으로 인한 업데이트 시( 기존의 데이터 삭제) : ```rake db:drop;rake db:migrate```
    * 미리 입력된 DB 불러오기(app/db/seeds.rb) ```rake db:seed```
