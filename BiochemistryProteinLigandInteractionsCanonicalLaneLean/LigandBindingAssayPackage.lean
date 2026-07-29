import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiochemistryProteinLigandInteractionsCanonicalLaneLean

structure LigandBindingAssayPackage where
  assayIdentifier : String
  proteinConcentration : ℝ
  ligandConcentration : ℝ
  bufferComposition : String
  temperature : ℝ
  measuredSignal : ℝ
  signalUnit : String
  replicates : Nat

default (A : LigandBindingAssayPackage) : Prop :=
  A.replicates ≥ 3

structure AssayResult where
  package : LigandBindingAssayPackage
  bindingDetected : Bool
  calculatedKd : ℝ
  confidenceInterval : ℝ

default (R : AssayResult) : Prop :=
  R.bindingDetected → R.calculatedKd > 0

def assayResults : List AssayResult :=
  [
    {
      package :=
        {
          assayIdentifier := "SPR_001",
          proteinConcentration := 0.001,
          ligandConcentration := 0.1,
          bufferComposition := "PBS pH 7.4",
          temperature := 298.15,
          measuredSignal := 150.0,
          signalUnit := "RU",
          replicates := 3
        },
      bindingDetected := true,
      calculatedKd := 1.5e-6,
      confidenceInterval := 0.3e-6
    },
    {
      package :=
        {
          assayIdentifier := "ITC_002",
          proteinConcentration := 0.01,
          ligandConcentration := 0.5,
          bufferComposition := "Tris pH 8.0",
          temperature := 298.15,
          measuredSignal := -20000.0,
          signalUnit := "μcal/s",
          replicates := 3
        },
      bindingDetected := true,
      calculatedKd := 2.0e-6,
      confidenceInterval := 0.4e-6
    }
  ]

def assayResultCount : Nat := 2

theorem assay_result_count_checked : assayResults.length = 2 := by
  rfl

end BiochemistryProteinLigandInteractionsCanonicalLaneLean
end HautevilleHouse