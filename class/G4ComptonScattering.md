<!-- G4ComptonScattering.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 7月 14 12:20:01 2018 (+0800)
;; Last-Updated: 六 7月 14 12:48:31 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 2
;; URL: http://wuhongyi.cn -->

# G4ComptonScattering

**public G4VEmProcess**

- Model 1
	- G4KleinNishinaCompton

## class

```cpp
public:  // with description

  explicit G4ComptonScattering(const G4String& processName ="compt",
			       G4ProcessType type = fElectromagnetic);

  virtual ~G4ComptonScattering();

  // true for Gamma only.  
  virtual G4bool IsApplicable(const G4ParticleDefinition&) final;
  
  // Print few lines of informations about the process: validity range,
  virtual void PrintInfo() override;
 
  // print description in html
  virtual void ProcessDescription(std::ostream&) const override;

protected:

  virtual void InitialiseProcess(const G4ParticleDefinition*) override;

private:
     
  G4ComptonScattering & operator=(const  G4ComptonScattering &right) = delete;
  G4ComptonScattering(const  G4ComptonScattering&) = delete;
```

<!-- G4ComptonScattering.md ends here -->
