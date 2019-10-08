using TensorOperations, Test

@testset "Optimal contraction order" begin
    _,cost = @optimalcontractiontree A[-1,1,2,3]*B[2,4,5,6]*C[1,5,7,-3]*D[3,8,4,9]*
                                    E[6,9,7,10]*F[-2,8,11,12]*G[10,11,12,-4]
    @test cost == TensorOperations.Poly{:χ,Int}([0,0,0,0,0,0,2,2,2])

    _,cost = @optimalcontractiontree A[1,4,5,6,7,8]*B[2,9,10,11,12,13]*C[3,14,15,16,17,18]*
                                    D[-6,9,23,24,25,26]*E[-5,5,19,20,21,22]*F[8,14,27,28,29,30]*
                                    G[12,15,31,32,33,34]*H[22,25,28,31,35,36,37,38]*I[-4,20,23,35,39,40,41,42]*
                                    J[42,36,37,38,43,44,45,46]*K[41,24,44,26,47,48]*L[19,40,21,43,49,50]*
                                    M[27,45,29,30,51,52]*N[46,32,33,34,53,54]*O[-2,-3,39,49,47,55]*
                                    P[4,50,6,7,51,56]*Q[48,10,11,53,13,57]*R[52,54,16,17,18,58]*S[55,56,57,58,-1,1,2,3]
    @test cost == TensorOperations.Poly{:χ,Int}([0,0,0,0,0,0,0,0,0,5,5,0,1,1,3,0,3])

    _,cost = @optimalcontractiontree a[64,72,73,19,22]*b[65,74,75,23,76]*c[66,77,20,79,28]*d[67,21,24,29,34]*
                                    e[68,25,78,35,80]*f[69,81,30,83,84]*g[70,31,36,85,86]*h[71,37,82,87,88]*
                                    i[-5,19,20,21,1,2,4,5]*j[22,23,24,25,3,26,6,27]*k[28,29,30,31,7,8,32,33]*
                                    l[34,35,36,37,9,38,39,40]*m[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18]*
                                    n[10,11,13,14,41,42,43,44]*o[12,26,15,27,47,48,49,50]*
                                    p[16,17,32,33,53,54,55,56]*q[18,38,39,40,60,61,62,63]*r[-2,-3,-4,41,89]*
                                    s[72,73,42,47,90]*t[74,75,48,76,45]*u[77,43,79,53,46]*v[44,49,54,60,51]*
                                    w[50,78,61,80,52]*x[81,55,83,84,57]*y[56,62,85,86,58]*z[63,82,87,88,59]*
                                    aa[89,90,45,46,51,52,57,58,59,-1,64,65,66,67,68,69,70,71]
    @test cost == TensorOperations.Poly{:χ,Int}([0,0,0,0,0,0,0,4,4,0,0,0,1,1,1,0,1,0,0,0,3,0,3,2,0,2,4])
end
