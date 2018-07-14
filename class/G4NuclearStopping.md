<!-- G4NuclearStopping.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 7月 14 11:49:52 2018 (+0800)
;; Last-Updated: 六 7月 14 12:05:31 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 2
;; URL: http://wuhongyi.cn -->

# G4NuclearStopping

**public G4VEmProcess**

The class simulates nuclear stopping due to multiple scattering

*It should be instantiated after G4ionIonisation*


- Model
	- G4ICRU49NuclearStoppingModel


## class

```cpp
public:    // with description

  explicit G4NuclearStopping(const G4String& processName="nuclearStopping");

  virtual ~G4NuclearStopping();

  // returns true for charged particles, false otherwise
  G4bool IsApplicable (const G4ParticleDefinition& p) final;

  // implementation of pure virtual method
  G4double AlongStepGetPhysicalInteractionLength(const G4Track& track,
						 G4double  previousStepSize,
						 G4double  currentMinimumStep,
						 G4double& proposedSafety,
						 G4GPILSelection* selection) final;

  // implementation of energy loss along step
  G4VParticleChange* AlongStepDoIt(const G4Track& track,
				   const G4Step&  step) final;

  // Print few lines of informations about the process: validity range,
  virtual void PrintInfo() final;

  // print documentation in html format
  virtual void ProcessDescription(std::ostream&) const override;

protected:

  // This function initialise process
  void InitialiseProcess(const G4ParticleDefinition*) final;

private:       

  // copy constructor and hide assignment operator
  G4NuclearStopping(G4NuclearStopping &) = delete;
  G4NuclearStopping & operator=(const G4NuclearStopping &right) = delete;
```



<!-- G4NuclearStopping.md ends here -->
