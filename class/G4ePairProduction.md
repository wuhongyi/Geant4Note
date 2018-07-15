<!-- G4ePairProduction.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 日 7月 15 08:23:59 2018 (+0800)
;; Last-Updated: 日 7月 15 08:27:26 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4ePairProduction

**public G4VEnergyLossProcess**

This class manages the PairProduction process for e+-.

- Model
	- G4MuPairProductionModel
	- G4VEmFluctuationModel


- lowestKinEnergy 100.*MeV

## class

```cpp
public:

  explicit G4ePairProduction(const G4String& processName = "ePairProd");

  virtual ~G4ePairProduction();

  virtual G4bool IsApplicable(const G4ParticleDefinition& p) override;

  virtual G4double MinPrimaryEnergy(const G4ParticleDefinition* p,
				    const G4Material*, G4double cut) override;

  inline void SetLowestKineticEnergy(G4double e);

  // print description in html
  virtual void ProcessDescription(std::ostream&) const override;

protected:

  // Print out of the class parameters
  virtual void StreamProcessInfo(std::ostream& outFile,
                             G4String endOfLine=G4String("\n")) const override;

  virtual void InitialiseEnergyLossProcess(const G4ParticleDefinition*,
					   const G4ParticleDefinition*) override;

private:

  G4ePairProduction & operator=(const G4ePairProduction &right) = delete;
  G4ePairProduction(const G4ePairProduction&) = delete;
```

<!-- G4ePairProduction.md ends here -->
