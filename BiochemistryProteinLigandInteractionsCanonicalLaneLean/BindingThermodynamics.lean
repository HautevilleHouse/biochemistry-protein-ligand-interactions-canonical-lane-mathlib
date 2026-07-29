import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiochemistryProteinLigandInteractionsCanonicalLaneLean

structure BindingThermodynamicsPackage where
  gibbsFreeEnergy : ℝ
  enthalpy : ℝ
  entropy : ℝ
  deltaGEqNegative : Prop
  spontaneity : Prop

structure BindingThermodynamicsEvidence (B : BindingThermodynamicsPackage) where
  gibbsFreeEnergyClosed : B.gibbsFreeEnergy < 0
  enthalpyClosed : B.enthalpy < 0
  entropyClosed : B.entropy > 0
  deltaGEqNegativeClosed : B.deltaGEqNegative
  spontaneityClosed : B.spontaneity

def BindingThermodynamicsClosed (B : BindingThermodynamicsPackage) : Prop :=
  B.gibbsFreeEnergy < 0 ∧ B.enthalpy < 0 ∧ B.entropy > 0 ∧
  B.deltaGEqNegative ∧ B.spontaneity

theorem binding_thermodynamics_closed_from_evidence (B : BindingThermodynamicsPackage) (E : BindingThermodynamicsEvidence B) :
  BindingThermodynamicsClosed B :=
by
  exact And.intro E.gibbsFreeEnergyClosed
    (And.intro E.enthalpyClosed
      (And.intro E.entropyClosed
        (And.intro E.deltaGEqNegativeClosed E.spontaneityClosed)))

end BiochemistryProteinLigandInteractionsCanonicalLaneLean
end HautevilleHouse