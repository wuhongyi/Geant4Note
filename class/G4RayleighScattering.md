<!-- G4RayleighScattering.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 日 7月 15 05:03:18 2018 (+0800)
;; Last-Updated: 日 7月 15 05:05:02 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4RayleighScattering

**public G4VEmProcess**

Class to implement Rayleigh scattering as a physics process. The default model used for the process is G4LivermoreRayleighModel

- Model
	- G4LivermoreRayleighModel


## class

```cpp
public:  // with description

  explicit G4RayleighScattering(const G4String& processName ="Rayl",
		                G4ProcessType type = fElectromagnetic);

  virtual ~G4RayleighScattering();

  // true for Gamma only.  
  G4bool IsApplicable(const G4ParticleDefinition&) final;
  
  // Print few lines of informations about the process: validity range,
  virtual void PrintInfo() override;

  // print description in html
  virtual void ProcessDescription(std::ostream&) const override;

protected:

  virtual void InitialiseProcess(const G4ParticleDefinition*) override;

private:
     
  // hide assignment operator
  G4RayleighScattering & operator=(const G4RayleighScattering &right) = delete;
  G4RayleighScattering(const G4RayleighScattering&) = delete;
```

<!-- G4RayleighScattering.md ends here -->
