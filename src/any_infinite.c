#include "any_infinite.h"

static Rboolean any_infinite_double(SEXP x);
static Rboolean any_infinite_complex(SEXP x);
static Rboolean any_infinite_list(SEXP x);
static Rboolean any_infinite(SEXP x);


static Rboolean any_infinite_double(SEXP x) {
    const double * xp = REAL(x);
    const double * const xe = xp + length(x);
    for (; xp != xe; xp++) {
        if (*xp == R_PosInf || *xp == R_NegInf)
            return TRUE;
    }
    return FALSE;
}

static Rboolean any_infinite_complex(SEXP x) {
    const Rcomplex * xp = COMPLEX(x);
    const Rcomplex * const xe = xp + length(x);
    for (; xp != xe; xp++) {
        if ((*xp).r == R_PosInf || (*xp).i == R_PosInf ||
            (*xp).r == R_NegInf || (*xp).i == R_NegInf)
            return TRUE;
    }
    return FALSE;
}

static Rboolean any_infinite_list(SEXP x) {
    const R_len_t nx = length(x);
    for (R_len_t i = 0; i < nx; i++) {
        if (any_infinite(VECTOR_ELT(x, i)))
            return TRUE;
    }
    return FALSE;
}

static Rboolean any_infinite(SEXP x) {
    switch(TYPEOF(x)) {
        case REALSXP: return any_infinite_double(x);
        case CPLXSXP: return any_infinite_complex(x);
        case VECSXP:  return any_infinite_list(x);
    }
    return FALSE;
}


SEXP c_any_infinite(SEXP x) {
    return ScalarLogical(any_infinite(x));
}
