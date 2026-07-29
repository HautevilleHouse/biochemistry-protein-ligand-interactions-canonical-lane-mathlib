import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiochemistryProteinLigandInteractionsCanonicalLaneLean

def ConstrainedBiochemistryProteinLigandClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_biochemistry_protein_ligand_endgame (A : AdmissibleClass) :
    ConstrainedBiochemistryProteinLigandClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BiochemistryProteinLigandInteractionsCanonicalLaneLean
end HautevilleHouse