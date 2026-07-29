import BiochemistryProteinLigandInteractionsCanonicalLaneLean.LigandBindingKinetics

namespace HautevilleHouse
namespace BiochemistryProteinLigandInteractionsCanonicalLaneLean

structure ThermodynamicProfilePackage where
  enthalpy : ℝ
  entropy : ℝ
  freeEnergy : ℝ
  thermodynamicConsistency : Prop

structure ThermodynamicProfileEvidence (T : ThermodynamicProfilePackage) where
  enthalpyFinite : T.enthalpy ≠ 0
  entropyFinite : T.entropy ≠ 0
  freeEnergyCalculated : T.freeEnergy = T.enthalpy - 298.15 * T.entropy

def ThermodynamicProfileClosed (T : ThermodynamicProfilePackage) : Prop :=
  T.thermodynamicConsistency

theorem thermodynamic_profile_closed_from_evidence (T : ThermodynamicProfilePackage)
    (E : ThermodynamicProfileEvidence T) : ThermodynamicProfileClosed T := by
  exact E.freeEnergyCalculated

end BiochemistryProteinLigandInteractionsCanonicalLaneLean
end HautevilleHouse