# 🔥 HotSource — 디지털 콘텐츠 공유 플랫폼

> **개발자와 디자이너가 프로젝트 제작에 필요한 이미지와 BGM을 공유할 수 있는 플랫폼**

---

## 📘 프로젝트 개요

**HotSource**는 개발자와 디자이너가 프로젝트에 사용할 수 있는  
이미지, 배경음악(BGM), 디자인 리소스를 업로드·다운로드하며  
서로의 아이디어를 교류할 수 있는 **디지털 콘텐츠 공유 플랫폼**입니다.  

> 🎯 **목표:** 콘텐츠 제작자들이 리소스를 효율적으로 공유하고 협업할 수 있는 안전한 거래 기반 커뮤니티 구축

---

## ⚙️ 기술 스택

### 🧩 Backend
![Java](https://img.shields.io/badge/Java-%23ED8B00.svg?style=flat-square&logo=openjdk&logoColor=white)
![Spring Framework](https://img.shields.io/badge/Spring_Framework-6DB33F?style=flat-square&logo=spring&logoColor=white)
![Spring Security](https://img.shields.io/badge/Spring_Security-6DB33F?style=flat-square&logo=springsecurity&logoColor=white)
![MyBatis](https://img.shields.io/badge/MyBatis-FF6C37?style=flat-square&logoColor=white)
![JSP](https://img.shields.io/badge/JSP-007396?style=flat-square&logo=java&logoColor=white)

### 🎨 Frontend
![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=flat-square&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=flat-square&logo=css3&logoColor=white)
![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=flat-square&logo=javascript&logoColor=black)
![Bootstrap](https://img.shields.io/badge/Bootstrap-7952B3?style=flat-square&logo=bootstrap&logoColor=white)

### ☁️ Infra & DevOps
![Apache Tomcat](https://img.shields.io/badge/Tomcat-F8DC75?style=flat-square&logo=apachetomcat&logoColor=black)
![MySQL](https://img.shields.io/badge/MySQL-005C84?style=flat-square&logo=mysql&logoColor=white)

---

## 💡 주요 기능

| 기능 | 설명 |
|------|------|
| 🧾 **콘텐츠 업로드/관리** | 이미지, 음악 등 파일 업로드 및 썸네일 자동 생성 |
| 🔒 **OAuth2.0 로그인** | Google, Naver, Kakao 소셜 로그인 연동 |
| 🧮 **트랜잭션 기반 등록/삭제 처리** | 파일과 DB 간 데이터 무결성 유지 |
| 💬 **댓글 및 좋아요 기능** | 게시물 반응 및 커뮤니티 피드백 |
| 🔍 **검색 필터링 기능** | 키워드 및 카테고리 기반 콘텐츠 탐색 |
| 🧱 **관리자 페이지** | 회원 및 게시물 관리 기능 구현 |
| ⚙️ **서버 사이드 렌더링 (SSR)** | JSP + Tomcat을 통한 서버 렌더링 구조 설계 |

---

## ⚡ 트러블슈팅 & 개선

- **문제:** 게시물 등록 시 파일 저장과 DB 트랜잭션이 분리되어 데이터 불일치 발생  
  → **해결:** 트랜잭션 범위를 서비스 계층으로 확장하여  
  파일 저장 실패 시 DB 롤백 처리로 일관성 확보

- **문제:** 다중 테이블 조인 시 MyBatis ResultMap 중복 정의로 유지보수 어려움  
  → **해결:** Mapper 구조를 통합하고 공통 ResultMap을 분리하여  
  **재사용성과 가독성**을 개선

- **문제:** 페이지별 접근 권한이 일관되지 않음  
  → **해결:** Spring Security를 통한 Role 기반 접근 제어 적용  
  (USER, SELLER, ADMIN 구분)

> ✅ 결과: 데이터 무결성 확보, 권한 체계 강화, 페이지 응답 속도 개선  
> SSR 구조와 배포 환경을 통합적으로 이해하며 백엔드 전반의 안정성 향상

---

## 🧠 배운 점

- JSP 기반 **서버 사이드 렌더링(SSR)**의 작동 원리와 데이터 전달 흐름 이해  
- **트랜잭션 처리, 보안 설계, SQL 매핑 최적화**의 중요성 체감  
- **Spring Security + OAuth2.0** 연동 경험으로 인증 구조의 기초 확립  
- **Tomcat·Nginx 환경 구성 및 배포 프로세스** 직접 구축 경험

---

> 🔥 *HotSource: Connect. Create. Share.*  
> — "개발자와 디자이너를 연결하는 디지털 콘텐츠 공유 플랫폼"
