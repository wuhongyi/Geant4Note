<!-- G4eBremsstrahlung.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 日 7月 15 07:31:17 2018 (+0800)
;; Last-Updated: 日 7月 15 07:34:16 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 2
;; URL: http://wuhongyi.cn -->

# G4eBremsstrahlung

**public G4VEnergyLossProcess**

This class manages the bremsstrahlung for e-/e+

- Model 0
	- G4SeltzerBergerModel
	- G4VEmFluctuationModel
- Model 1
	- G4eBremsstrahlungRelModel
	- G4VEmFluctuationModel	
	
	

## class

```cpp
public:

  explicit G4eBremsstrahlung(const G4String& name = "eBrem");

  virtual ~G4eBremsstrahlung();

  virtual G4bool IsApplicable(const G4ParticleDefinition& p) final;
  
  // print documentation in html format
  virtual void ProcessDescription(std::ostream&) const override;

protected:

  // Print out of the class parameters
  virtual void StreamProcessInfo(std::ostream& outFile,
                             G4String endOfLine=G4String("\n")) const override;

  virtual void 
  InitialiseEnergyLossProcess(const G4ParticleDefinition*,
			      const G4ParticleDefinition*) override;

  G4bool   isInitialised;

private:

  // hide assignment operator
  G4eBremsstrahlung & operator=(const G4eBremsstrahlung &right) = delete;
  G4eBremsstrahlung(const G4eBremsstrahlung&) = delete;
```

<!-- G4eBremsstrahlung.md ends here -->
