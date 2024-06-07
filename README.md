# CEPARCO_S11_GRP2_SIMD_MP

<h3> i.) Screenshot of the Program Output with Execution Time for All Cases </h3>

<h4> DEBUG, Vector size n = 2^20 </h4>

<img src = "https://github.com/AntonioLuizVeloso/CEPARCO_S11_GRP2_SIMD_MP/assets/92433849/cdbd4072-f892-428a-bce2-9e7784041272" height = "500" width = "400"> <img src = "https://github.com/AntonioLuizVeloso/CEPARCO_S11_GRP2_SIMD_MP/assets/92433849/fac3929c-e018-4893-971d-c8a6c8861fe1" height = "500" width = "400"> <img src = "https://github.com/AntonioLuizVeloso/CEPARCO_S11_GRP2_SIMD_MP/assets/92433849/47fcca2b-6457-489a-93ac-1a9390460fbd" height = "500" width = "400"> <img src = "https://github.com/AntonioLuizVeloso/CEPARCO_S11_GRP2_SIMD_MP/assets/92433849/97bd101c-10dc-4358-ad1b-d4f84790b055" height = "500" width = "400">

<h4> DEBUG, Vector size n = 2^26 </h4>

<img src = "https://github.com/AntonioLuizVeloso/CEPARCO_S11_GRP2_SIMD_MP/assets/92433849/fc34a33d-35c7-4a56-b33f-7df38ae054e7" height = "500" width = "400"> <img src = "https://github.com/AntonioLuizVeloso/CEPARCO_S11_GRP2_SIMD_MP/assets/92433849/35fc7e25-928b-49a0-9d6e-e38c89bc37fc" height = "500" width = "400"> <img src = "https://github.com/AntonioLuizVeloso/CEPARCO_S11_GRP2_SIMD_MP/assets/92433849/4e5f3602-b584-4b17-99ea-cef17e097cda" height = "500" width = "400"> <img src = "https://github.com/AntonioLuizVeloso/CEPARCO_S11_GRP2_SIMD_MP/assets/92433849/1350ae30-1bb6-4240-aa8c-38bc9b752ae3" height = "500" width = "400">

<h4> DEBUG, Vector size n = 2^30 </h4>

<img src = "" height = "500" width = "400"> <img src = "" height = "500" width = "400"> <img src = "" height = "500" width = "400"> <img src = "" height = "500" width = "400">

<h4> RELEASE, Vector size n = 2^20 </h4>

<img src = "https://github.com/AntonioLuizVeloso/CEPARCO_S11_GRP2_SIMD_MP/assets/92433849/7af418a2-0869-4a53-8bb7-3ea46d2db3e2" height = "500" width = "400"> <img src = "https://github.com/AntonioLuizVeloso/CEPARCO_S11_GRP2_SIMD_MP/assets/92433849/594e95ae-e099-4c8c-a3a2-d3de90758104" height = "500" width = "400"> <img src = "https://github.com/AntonioLuizVeloso/CEPARCO_S11_GRP2_SIMD_MP/assets/92433849/cca51727-9cd4-4a7b-a058-87000d14dbcc" height = "500" width = "400"> <img src = "https://github.com/AntonioLuizVeloso/CEPARCO_S11_GRP2_SIMD_MP/assets/92433849/e1613915-4c9d-48ae-b5f4-f4b9e983bf44" height = "500" width = "400">

<h4> RELEASE, Vector size n = 2^26 </h4>

<img src = "https://github.com/AntonioLuizVeloso/CEPARCO_S11_GRP2_SIMD_MP/assets/92433849/95e4e295-d446-4530-8046-bfa4f764cff0" height = "500" width = "400"> <img src = "https://github.com/AntonioLuizVeloso/CEPARCO_S11_GRP2_SIMD_MP/assets/92433849/b0bbddc5-c525-454e-be29-0ee6de4a67e3" height = "500" width = "400"> <img src = "https://github.com/AntonioLuizVeloso/CEPARCO_S11_GRP2_SIMD_MP/assets/92433849/f50dd44a-03e5-43a2-9d5d-88488c41eb80" height = "500" width = "400"> <img src = "https://github.com/AntonioLuizVeloso/CEPARCO_S11_GRP2_SIMD_MP/assets/92433849/f8205ac5-a37e-4754-9616-9ced4aa9610a" height = "500" width = "400">

<h4> RELEASE, Vector size n = 2^30 </h4>

<img src = "https://github.com/AntonioLuizVeloso/CEPARCO_S11_GRP2_SIMD_MP/assets/119172963/196afb56-c524-48d8-9ab8-5fd2b5affc7d" height = "500" width ="400"> 
<img src = "https://github.com/AntonioLuizVeloso/CEPARCO_S11_GRP2_SIMD_MP/assets/119172963/24cc003d-6474-4c4f-a115-dffdf126bd1f" height = "500" width ="400"> <img src = "https://github.com/AntonioLuizVeloso/CEPARCO_S11_GRP2_SIMD_MP/assets/119172963/a9135bfb-2562-4779-941c-5045fdb50fb2" height = "500" width ="400"> <img src = "https://github.com/AntonioLuizVeloso/CEPARCO_S11_GRP2_SIMD_MP/assets/119172963/ab67ed87-2721-4382-95f2-9b39328cab6d" height = "500" width = "400">

ii.) Comparative Table of Execution Time + Analysis of the Performance of Different Kernels

| Version | Kernel | Execution Time for n = 2<sup>20</sup> | Execution Time for n = 2<sup>26</sup> | Execution Time for n = 2<sup>30</sup> |
| --- | --- | --- | --- | --- |
| Debug | C | 4.352280 ms | 165.044217 ms | |
| Release | C | 0.514263 ms | 38.037137 ms | |
| Debug | NON-SIMD | 7.154423 ms | 243.168383 ms | |
| Release | NON-SIMD | 4.653573 ms | 239.715557 ms | |
| Debug | SIMD w/ XMM | 1.195450 ms | 44.066440 ms | |
| Release | SIMD w/ XMM | 0.880623 ms | 39.116787 ms | |
| Debug | SIMD w/ YMM | 0.023947 ms | 1.266637 ms | |
| Release | SIMD w/ YMM | 0.017117 ms | 1.130136 ms | |

<h5 align = "justify">
  As shown in the table above, for the Debug Version, it can be observed that YMM is faster than XMM, which is faster than C, which is faster than Non-SIMD. This stays mostly the same for the Release version, except that C becomes slightly faster than the XMM implementation. Further, the Release Version is much faster than the Debug version because the Release Version of Visual Studio tries to generally optimize performance. 
</h5>

<h5 align = "justify">
  YMM is the fastest because... XMM is the second fastest because... XMM becomes the third fastest in the Release version because... C is the third fastest because... Non-SIMD is the slowest because...
</h5>

<h3> iii.) Screenshot of the Program Output w/ Correctness Check (C) </h3>

<img src = "https://github.com/AntonioLuizVeloso/CEPARCO_S11_GRP2_SIMD_MP/assets/92433849/06d5b3a4-f25d-4e75-a30f-62d862267559" width = "400">

<h5>
  This output will be compared to the outputs of other implementations to determine their correctness.
</h5>

<h3> iv.) Screenshot of the Program Output including Correctness Check (x86-64) </h3>

<img src = "https://github.com/AntonioLuizVeloso/CEPARCO_S11_GRP2_SIMD_MP/assets/92433849/ea2cdc56-d3ff-484a-9552-30678ace2f32" width = "400">

<h5>
  This output is the same as the C output, so it is correct.
</h5>

<h3> v.) Screenshot of the Program Output including Correctness Check (SIMD XMM Register) </h3>

<img src = "https://github.com/AntonioLuizVeloso/CEPARCO_S11_GRP2_SIMD_MP/assets/92433849/abaadf61-3ea3-46cf-ae43-f92a5623f181" width = "400">

<h5>
  This output is the same as the C output, so it is correct.
</h5>

<h3> vi.) Screenshot of the Program Output including Correctness Check (SIMD YMM Register) </h3>

<img src = "https://github.com/AntonioLuizVeloso/CEPARCO_S11_GRP2_SIMD_MP/assets/92433849/93bf8585-ca69-4fbd-b28b-6726c7f32204" width = "400">

<h5>
  This output is the same as the C output, so it is correct.
</h5>

<h3> vii.) Discussion of Problems Encountered and Solutions Implemented </h3>

<h5>
  Brute force method for both SIMD AHA
</h5>

<h5>
  Boundary handling for SIMD XMM and SIMD YMM was done by... this was tested by... add screenshots as proof???
</h5>
