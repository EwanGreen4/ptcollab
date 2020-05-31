#ifndef pxtnPulse_Frequency_H
#define pxtnPulse_Frequency_H

#include "./pxtn.h"

/* TODO: This should really just be a few functions. No need to malloc. */
class pxtnPulse_Frequency {
 private:
  void operator=(const pxtnPulse_Frequency& src) = delete;
  pxtnPulse_Frequency(const pxtnPulse_Frequency& src) = delete;

  float* _freq_table;
  double _GetDivideOctaveRate(int32_t divi);

 public:
  pxtnPulse_Frequency();
  ~pxtnPulse_Frequency();

  bool Init();

  float Get(int32_t key) const;
  float Get2(int32_t key) const;
  const float* GetDirect(int32_t* p_size);
};

#endif
