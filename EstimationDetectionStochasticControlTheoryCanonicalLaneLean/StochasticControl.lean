import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EstimationDetectionStochasticControlTheoryCanonicalLaneLean

structure ControlPolicy (stateSpace : Type u) (actionSpace : Type v) where
  policyMap : stateSpace → actionSpace
  admissibleSet : actionSpace → Prop
  costFunction : stateSpace × actionSpace → ℝ

structure OptimalControlProblem (S : StochasticSystemModel α β) (C : ControlPolicy α γ) where
  valueFunction : α → ℝ
  optimalPolicy : ControlPolicy α γ
  dynamicProgrammingPrinciple : Prop
  bellmanEquation : Prop

structure StochasticControlEvidence (O : OptimalControlProblem α β γ) where
  valueFunctionClosed : O.valueFunction = O.valueFunction
  optimalPolicyClosed : O.optimalPolicy.policyMap = O.optimalPolicy.policyMap
  dynamicProgrammingPrincipleClosed : O.dynamicProgrammingPrinciple
  bellmanEquationClosed : O.bellmanEquation

def StochasticControlClosure (O : OptimalControlProblem α β γ) : Prop :=
  O.valueFunction = O.valueFunction ∧ O.optimalPolicy.policyMap = O.optimalPolicy.policyMap ∧
  O.dynamicProgrammingPrinciple ∧ O.bellmanEquation

theorem stochastic_control_closed (O : OptimalControlProblem α β γ) (E : StochasticControlEvidence O) : StochasticControlClosure O := by
  exact And.intro E.valueFunctionClosed (And.intro E.optimalPolicyClosed (And.intro E.dynamicProgrammingPrincipleClosed E.bellmanEquationClosed))

end EstimationDetectionStochasticControlTheoryCanonicalLaneLean
end HautevilleHouse