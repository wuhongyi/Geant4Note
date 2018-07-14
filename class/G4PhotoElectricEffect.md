<!-- G4PhotoElectricEffect.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 7月 14 12:45:10 2018 (+0800)
;; Last-Updated: 六 7月 14 12:49:10 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4PhotoElectricEffect

**public G4VEmProcess**


- Model 1
	- G4PEEffectFluoModel

## class

```cpp
public:  // with description

  explicit G4PhotoElectricEffect(const G4String& processName ="phot",
				 G4ProcessType type = fElectromagnetic);

  virtual ~G4PhotoElectricEffect();

  // true for Gamma only.
  virtual G4bool IsApplicable(const G4ParticleDefinition&) final;

  // Print few lines of informations about the process: validity range,
  virtual void PrintInfo() override;

  // print documentation in html format
  virtual void ProcessDescription(std::ostream&) const override;

protected:

  virtual void InitialiseProcess(const G4ParticleDefinition*) override;

```

<!-- G4PhotoElectricEffect.md ends here -->
