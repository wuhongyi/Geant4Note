<!-- G4CoulombScattering.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 日 7月 15 07:08:16 2018 (+0800)
;; Last-Updated: 日 7月 15 07:11:40 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 2
;; URL: http://wuhongyi.cn -->

# G4CoulombScattering

**public G4VEmProcess**

This class manages the process of Coulomb elastic scattering

- Model 0
	- G4eCoulombScatteringModel
	- G4IonCoulombScatteringModel

## class

```cpp
public:

  explicit G4CoulombScattering(const G4String& name = "CoulombScat");

  virtual ~G4CoulombScattering();

  virtual G4bool IsApplicable(const G4ParticleDefinition& p) final;

  // print documentation in html format
  virtual void ProcessDescription(std::ostream&) const override;

protected:

  // Print out of the class parameters
  virtual void StreamProcessInfo(std::ostream& outFile,
                             G4String endOfLine=G4String("\n")) const override;

  virtual void InitialiseProcess(const G4ParticleDefinition*) override;

  virtual G4double MinPrimaryEnergy(const G4ParticleDefinition*,
                                    const G4Material*) final;

private:

 // hide assignment operator
  G4CoulombScattering & operator=(const G4CoulombScattering &right) = delete;
  G4CoulombScattering(const G4CoulombScattering&) = delete;
```

<!-- G4CoulombScattering.md ends here -->
