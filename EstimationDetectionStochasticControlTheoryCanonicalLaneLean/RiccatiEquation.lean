import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EstimationDetectionStochasticControlTheoryCanonicalLaneLean

structure RiccatiEquationPackage where
  matrixCoefficientA : Type u
  matrixCoefficientB : Type v
  matrixCoefficientQ : Type w
  matrixCoefficientR : Type x
  solutionP : Type y
  algebraicRiccatiEquation : Prop
  stabilizingSolution : Prop
  optimalGain : Prop
  closedLoopEigenvalues : Prop

structure RiccatiEquationEvidence (R : RiccatiEquationPackage) where
  algebraicRiccatiEquationClosed : R.algebraicRiccatiEquation
  stabilizingSolutionClosed : R.stabilizingSolution
  optimalGainClosed : R.optimalGain
  closedLoopEigenvaluesClosed : R.closedLoopEigenvalues

def RiccatiEquationClosed (R : RiccatiEquationPackage) : Prop :=
  R.algebraicRiccatiEquation ∧ R.stabilizingSolution ∧
  R.optimalGain ∧ R.closedLoopEigenvalues

theorem riccati_equation_closed_from_evidence
    (R : RiccatiEquationPackage) (E : RiccatiEquationEvidence R) :
    RiccatiEquationClosed R := by
  exact And.intro E.algebraicRiccatiEquationClosed
    (And.intro E.stabilizingSolutionClosed
      (And.intro E.optimalGainClosed E.closedLoopEigenvaluesClosed))

end EstimationDetectionStochasticControlTheoryCanonicalLaneLean
end HautevilleHouse
