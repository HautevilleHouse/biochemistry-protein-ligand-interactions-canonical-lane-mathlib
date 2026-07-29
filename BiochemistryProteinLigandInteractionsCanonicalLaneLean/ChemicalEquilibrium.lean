import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiochemistryProteinLigandInteractionsCanonicalLaneLean

structure ChemicalEquilibriumPackage where
  equilibriumConstant : ℝ
  bindingAffinity : ℝ
  concentrationRatio : ℝ
  massActionLawSatisfied : Prop
  leChatelierPrinciple : Prop

structure ChemicalEquilibriumEvidence (C : ChemicalEquilibriumPackage) where
  equilibriumConstantClosed : C.equilibriumConstant > 0
  bindingAffinityClosed : C.bindingAffinity > 0
  concentrationRatioClosed : C.concentrationRatio > 0
  massActionLawSatisfiedClosed : C.massActionLawSatisfied
  leChatelierPrincipleClosed : C.leChatelierPrinciple

def ChemicalEquilibriumClosed (C : ChemicalEquilibriumPackage) : Prop :=
  C.equilibriumConstant > 0 ∧ C.bindingAffinity > 0 ∧ C.concentrationRatio > 0 ∧
  C.massActionLawSatisfied ∧ C.leChatelierPrinciple

theorem chemical_equilibrium_closed_from_evidence (C : ChemicalEquilibriumPackage) (E : ChemicalEquilibriumEvidence C) :
  ChemicalEquilibriumClosed C :=
by
  exact And.intro E.equilibriumConstantClosed
    (And.intro E.bindingAffinityClosed
      (And.intro E.concentrationRatioClosed
        (And.intro E.massActionLawSatisfiedClosed E.leChatelierPrincipleClosed)))

end BiochemistryProteinLigandInteractionsCanonicalLaneLean
end HautevilleHouse