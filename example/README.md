# airtablej_example

AirTable : [Link](https://airtable.com/)

- AirTable SignUp / AirTable 홈페이지에서 회원가입을 진행합니다.
- Create 'Table' / 테이블을 생성합니다.
- Create Data / 생성한 테이블에 데이터를 입력합니다.
- Check Your Info -> API Key Open / 회원 정보에서 API 사용을 활성화하여 비밀번호를 활성화 합니다.

```dart
    AirtableCon air = new AirtableCon(
        key: "YOUR_API_KEY",
        tableName: "YOUR_TABLE_NAME"
    );
    bool check = await air.connect();
    print(air.result);
```

### Update Schedule
 - [ ] Offset Methods : ~ `20/11/20
 - [ ] DataClass : ~ `20/11/31