# VM(가상머신) 과 Disk

## 가상머신
### 가상 머신 이름과 호스트 이름
- 가상 머신 이름을 호스트 이름으로 사용
- Windows VM : 15 자
- Linux VM : 64 자
- 호스트 이름은 변경가능하나 가상 머신 이름은 변경 불가

### 배포 위치와 비용
- 실제 사용자 위치 : 사용자 위치가 가까와야 뛰어난 서비스 제공
- 법적 제한 사항이나 규정 준수, 세금 관련 요구사항을 만족하는 위치를 고려
- 동일한 가상 머신이라도 배포하는 위치에 따라 가격이 다를 수 있음
- 위치에 따라 사용 가능한 VM 크기 시리즈가 다를 수 있음

### 네트워킹 요소
1. 공용 IP 주소
   - 가상 머신과 Inbound 통신을 할 때 필요
2. 네트워크 보안 그룹(NSG)
   - 네트워크 트래픽을 필터링하는데 사용
   - 보안규칙에서 프로토콜과 포트 등을 지정해 Inbound/Outbound 트랙픽을 허용하거나 거부 할 있음
   - 가상 머신의 NIC 에 연결하거나 가상 네트워크의 subnet 에 연결할 수 있음
3. 네트워크 인터페이스 카드(NIC)
   - 가상 머신을 네트워크와 연결 할 때 사용
4. 가상 네트워크와 서브넷
   - VNet 은 한번 구성하면 변경하기 쉽지 않고 변경할 때 영향도가 크므로 시간을 들여 연결 토폴로지(Topology) 를 고민해야 함

### 가상 머신 크기
| 제품군(유형) | VM 크기 시리즈 | 설명 |
|:---|:---|:---|
|범용| B, Dsv3, Dv3, Dasv4, Dav4, DSv2, Dv2, Av2, DC, DCv2, Dv4, Dsv4, Ddv4, Ddsv4 | CPU와 메모리 비율이 적절한 균형을 갖음 </br> 테스트와 개발이나 중소형 데이터베이스, 소규모 트래픽용 웹 서버에 적합 </br>  CPU 와 메모리 비율이 1:4 |  
| 컴퓨터 최적화 | F, Fs, Fsv2 | 높은 CPU 와 메모리 비율을 갖음 </br> 중규모 트래픽용 웹 서버와 네트워크 어플라이언스, 배치 프로세스, 애프리케이션 서버에 적합 | 
| 메모리 최적화 | Esv3, Ev3, Easv4, Eav4, Ev4, Esv4, Edv4, Edsv4, Mv2, M, DSv2, Dv2 | 높은 메모리와 CPU 비율을 갖음 </br> 관계형 데이터베이스 서버, 중대형 캐시 서버, 인메모리 분석에 적합 </br> CPU 메모리 비율이 1:8 | 
| 스토리지 최적화 | Lsv | 디스크 처리량과 IO 가 높음 </br> 빅데이터, SQL, NoSQL 데이터베이스, 데이터 웨어하우징, 대형 트랜잭션 데이터베이스에 적합 | 
| GPU | NC, NCv2, NCv3, NCasT4_v3(미리보기), ND, NDv2(미리보기), NV, NVv3, NVv4 | 하나 이상의 GPU를 갖음 </BR> 그래픽 렌더링과 비디오 편집, ㅣ딥러닝에서 모델 학습과 추론(ND)에 효율적인 옵션 | 
| 고성능 컴퓨팅 | HB, HBv2, HC, H | 가장 빠르고 강력한 CPU 를 제공 </BR> 선택적으로 처리량이 높은 네트워크 인터페이스(RDMA) 를 제공하는 가상 머신 | 
| 기밀 컴퓨팅 | C1s_v2, DC2s_v2, DC4s_V2 및 DC8_v2 | 계산을 TEE(신뢰할 수 있는 실행 환경) 으로 격리해 처리(사용) 중인 데이터를 보호해야 할 때 사용함 </BR> TEE 는 보호된 환경에서 소프트웨어를 실행할 수 있도록 하드웨어의 프로세스와 메모리 일부에 대해 보호된 컨테이너를 제공해 TEE 외부에서 코드와 데이터를 보거나 수정하지 못하게 함 | 

---

## 가상 DISK
### 디스크 유형과 캐싱옵션
| 구분 | 읽기/쓰기 | 읽기 전용 | 없음 |
|:---|:---|:---|:---|
| 사용 예 | 운영체계 | 캐시 | 로그 파일|  
| 운영체제 디스크 | O(기본값) | X | O |    
| 임시 디스크 | O | O(기본값) | O |
| 데이터 디스크 | X | X | X |  

### 디스크 성능 유형
| 구분 | 표준 HDD | 표준 SSD | 프리미엄 SSD | 울트라 디스크 |  
|:---|:---|:---|:---|:---|  
| 디스크 종류 | OS/데이터 | OS/데이터 | 데이터 |  
| 성능 유형 | HDD | SSD | SSD | SSD |  
| 시나리오 | 대기시간이 민감하지 않은 워크로드 </BR> 개발/테스트/백업 | HDD 보다 나은 가용성/일관성/안정성/짧은 대기 시간이 피룡한 워크로드 </BR> 웹 서버와 IOPS 요구가 높지 않은 애플리케이션 서버 | IO 집약적 워크로드, 중요 업무용 프로덕션 애플리케이션 | 처리량 및 IOPS 가 높고 대기 시간이 짧아야 하는 데이터 집약적 워크로드 </br> SAP HANA, 고성능 데이터 베이스, 트랜잭션 집약적 워크로드 |  
| 최대 용량 | 32.767 GiB | 32,767 GiB | 32,767 GiB | 65,536 GiB |  
| 최대 처리량 | 500MB/s | 750MB/s | 900MB/s | 200,000MB/s |  
| 최대 IOPS | 2,000 | 6,000 | 20,000 | 160,000 |  

### Azure VM Scale Set(VMSS)
- MS 에서 제공하는 기본이미지, 혹은 커스텀 이미지를 기반으로 동일한 환경의 가상머신을 쉽게 배포할 수 있음
- 트래픽에 따라 자동 크기 조정 및 스케줄에 따른 확장 축소를 지원하며 부하분산 장치를 이용하여 트랙픽을 분산시킬 수 있음
- 대규무로 안정적인 배포 및 업데이트
  - 수백 대의 동일한 가상 머신을 짧은 시간에 배포
  - 업데이트 시 동일한 이미지로 배포
- 자동 크기 조정(Scale-Out)
  - 가상 머신을 미리 만들어 놓을 필요 없이 트래픽에 따라 자동으로 크기 조정