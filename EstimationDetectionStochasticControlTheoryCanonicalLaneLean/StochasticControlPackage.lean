import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EstimationDetectionStochasticControlTheoryCanonicalLaneLean

structure StochasticControlPackage where
  systemDynamics : Type u
  controlInput : Type v
  costFunctional : Type w
  valueFunction : Type x
  optimalControlLaw : Type y
  hjbEquation : Prop
  verificationTheorem : Prop
  closedLoopStability : Prop
  robustnessMargin : Prop

structure StochasticControlEvidence (C : StochasticControlPackage) where
  hjbEquationClosed : C.hjbEquation
  verificationTheoremClosed : C.verificationTheorem
  closedLoopStabilityClosed : C.closedLoopStability
  robustnessMarginClosed : C.robustnessMargin

def StochasticControlClosed (C : StochasticControlPackage) : Prop :=
  C.hjbEquation ∧ C.verificationTheorem ∧
  C.closedLoopStability ∧ C.robustnessMargin

theorem stochastic_control_closed_from_evidence
    (C : StochasticControlPackage) (E : StochasticControlEvidence C) :
    StochasticControlClosed C := by
  exact And.intro E.hjbEquationClosed
    (And.intro E.verificationTheoremClosed
      (And.intro E.closedLoopStabilityClosed E.robustnessMarginClosed))

end EstimationDetectionStochasticControlTheoryCanonicalLaneLean
end HautevilleHouse
