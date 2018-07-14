<!-- G4GammaConversion.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 日 7月 15 04:46:54 2018 (+0800)
;; Last-Updated: 日 7月 15 04:51:26 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 2
;; URL: http://wuhongyi.cn -->

# G4GammaConversion

**public G4VEmProcess**


- Model 0
	- G4BetheHeitlerModel
- Model 1
	- G4PairProductionRelModel


## class

```cpp
public:  // with description

  explicit G4GammaConversion(const G4String& processName ="conv",
			     G4ProcessType type = fElectromagnetic);

  virtual ~G4GammaConversion();

  // true for Gamma only.
  virtual G4bool IsApplicable(const G4ParticleDefinition&) final;

  virtual G4double MinPrimaryEnergy(const G4ParticleDefinition*,
				    const G4Material*) override;

  // Print few lines of informations about the process: validity range,
  virtual void PrintInfo() override;

  // print documentation in html format
  virtual void ProcessDescription(std::ostream&) const override;

protected:

  virtual void InitialiseProcess(const G4ParticleDefinition*) override;

private:
     
  G4GammaConversion & operator=(const  G4GammaConversion &right) = delete;
  G4GammaConversion(const  G4GammaConversion&) = delete;
```

<!-- G4GammaConversion.md ends here -->
