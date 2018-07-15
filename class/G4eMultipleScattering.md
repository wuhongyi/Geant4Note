<!-- G4eMultipleScattering.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 日 7月 15 06:51:15 2018 (+0800)
;; Last-Updated: 日 7月 15 06:54:25 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4eMultipleScattering

**public G4VMultipleScattering**

The class simulates the multiple scattering for e+ and e-

- Model 0
	- G4UrbanMscModel
- Model 1

## class

```cpp
public:    // with description

  explicit G4eMultipleScattering(const G4String& processName = "msc");

  virtual ~G4eMultipleScattering();

  // returns true for charged particles, false otherwise
  G4bool IsApplicable (const G4ParticleDefinition& p) final;

  // print documentation in html format
  virtual void ProcessDescription(std::ostream&) const override;

protected:

  // Print out of the class parameters
  virtual void StreamProcessInfo(std::ostream& outFile,
                             G4String endOfLine=G4String("\n")) const override;

  // This function initialise models
  void InitialiseProcess(const G4ParticleDefinition*) override;
```

<!-- G4eMultipleScattering.md ends here -->
