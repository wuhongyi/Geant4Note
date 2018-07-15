<!-- G4eplusAnnihilation.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 日 7月 15 08:35:46 2018 (+0800)
;; Last-Updated: 日 7月 15 08:37:05 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4eplusAnnihilation

**public G4VEmProcess**

This class manages the process of e+ annihilation into 2 gammas

- Model 0
	- G4eeToTwoGammaModel

## class

```cpp
public:

  explicit G4eplusAnnihilation(const G4String& name = "annihil");

  virtual ~G4eplusAnnihilation();

  virtual G4bool IsApplicable(const G4ParticleDefinition& p) final;

  virtual G4VParticleChange* AtRestDoIt(
                             const G4Track& track,
                             const G4Step& stepData) override;

  virtual G4double AtRestGetPhysicalInteractionLength(
                             const G4Track& track,
                             G4ForceCondition* condition
                            ) override;

  // print documentation in html format
  virtual void ProcessDescription(std::ostream&) const override;

protected:

  // Print out of the class parameters
  virtual void StreamProcessInfo(std::ostream& outFile,
                             G4String endOfLine=G4String("\n")) const override;

  virtual void InitialiseProcess(const G4ParticleDefinition*) override;
```

<!-- G4eplusAnnihilation.md ends here -->
