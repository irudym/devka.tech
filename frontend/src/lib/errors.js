/* eslint-disable import/prefer-default-export */
export const constructError = response => (
  {
    status: response.status,
    message: response.data.message || response.statusText,
  }
);
