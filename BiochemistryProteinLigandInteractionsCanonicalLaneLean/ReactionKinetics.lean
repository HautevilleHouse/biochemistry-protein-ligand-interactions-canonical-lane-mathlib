import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiochemistryProteinLigandInteractionsCanonicalLaneLean

structure ReactionKineticsPackage where
  bindingRateConstant : ℝ
  dissociationRateConstant : ℝ
  rateEquationsSatisfied : Prop
  massActionLaw : Prop
  steadyStateAssumption : Prop

structure ReactionKineticsEvidence (R : ReactionKineticsPackage) where
  bindingRateConstantClosed : R.bindingRateConstant > 0
  dissociationRateConstantClosed : R.dissociationRateConstant > 0
  rateEquationsSatisfiedClosed : R.rateEquationsSatisfied
  massActionLawClosed : R.massActionLaw
  steadyStateAssumptionClosed : R.steadyStateAssumption

def ReactionKineticsClosed (R : ReactionKineticsPackage) : Prop :=
  R.bindingRateConstant > 0 ∧ R.dissociationRateConstant > 0 ∧
  R.rateEquationsSatisfied ∧ R.massActionLaw ∧ R.steadyStateAssumption

theorem reaction_kinetics_closed_from_evidence (R : ReactionKineticsPackage) (E : ReactionKineticsEvidence R) :
  ReactionKineticsClosed R :=
by
  exact And.intro E.bindingRateConstantClosed
    (And.intro E.dissociationRateConstantClosed
      (And.intro E.rateEquationsSatisfiedClosed
        (And.intro E.massActionLawClosed E.steadyStateAssumptionClosed)))

end BiochemistryProteinLigandInteractionsCanonicalLaneLean
end HautevilleHouse