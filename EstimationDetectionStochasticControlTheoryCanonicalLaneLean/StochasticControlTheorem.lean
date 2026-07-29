import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EstimationDetectionStochasticControlTheoryCanonicalLaneLean

structure StochasticControlTheorem where
  linearQuadraticGaussian : Prop
  hjbEquation : Prop
  separationPrinciple : Prop
  certaintyEquivalence : Prop

structure StochasticControlEvidence (C : StochasticControlTheorem) where
  linearQuadraticGaussianClosed : C.linearQuadraticGaussian
  hjbEquationClosed : C.hjbEquation
  separationPrincipleClosed : C.separationPrinciple
  certaintyEquivalenceClosed : C.certaintyEquivalence

def StochasticControlClosed (C : StochasticControlTheorem) : Prop :=
  C.linearQuadraticGaussian ∧ C.hjbEquation ∧ C.separationPrinciple ∧ C.certaintyEquivalence

theorem stochastic_control_closed_from_evidence (C : StochasticControlTheorem) (E : StochasticControlEvidence C) :
    StochasticControlClosed C := by
  exact And.intro E.linearQuadraticGaussianClosed
    (And.intro E.hjbEquationClosed
      (And.intro E.separationPrincipleClosed E.certaintyEquivalenceClosed))

end EstimationDetectionStochasticControlTheoryCanonicalLaneLean
end HautevilleHouse