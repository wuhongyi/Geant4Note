<!-- G4eIonisation.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 日 7月 15 07:20:21 2018 (+0800)
;; Last-Updated: 日 7月 15 07:22:49 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4eIonisation

**public G4VEnergyLossProcess**

This class manages the ionisation process for e-/e+

- Model 0
	- G4MollerBhabhaModel
- G4UniversalFluctuation

## class

```cpp
public:

  explicit G4eIonisation(const G4String& name = "eIoni");

  virtual ~G4eIonisation();

  virtual G4bool IsApplicable(const G4ParticleDefinition& p) final;

  // Print out of the class parameters
  virtual void PrintInfo() override;

  // print documentation in html format
  virtual void ProcessDescription(std::ostream&) const override;

protected:

  virtual void 
  InitialiseEnergyLossProcess(const G4ParticleDefinition*,
			      const G4ParticleDefinition*) override;

  virtual G4double MinPrimaryEnergy(const G4ParticleDefinition*,
				    const G4Material*, G4double cut) final;

private:

  // hide assignment operator
  G4eIonisation & operator=(const G4eIonisation &right) = delete;
  G4eIonisation(const G4eIonisation&) = delete;
```

<!-- G4eIonisation.md ends here -->
