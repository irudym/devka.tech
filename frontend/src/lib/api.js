import { constructError } from './errors';
/* eslint-disable import/prefer-default-export */
const axios = require('axios');


export const signup = async ({ url, user }) => {
  try {
    const response = await axios.post(`${url}/signup`, user);
    return response.data;
  } catch (error) {
    throw error;
  }
};

export const login = async ({ url, credentials }) => {
  try {
    const response = await axios.post(`${url}/login`, credentials);
    return response.data;
  } catch (error) {
    throw error;
  }
};

export const createQuestion = async ({ url, question, token }) => {
  try {
    const response = await axios.post(
      `${url}/questions`,
      question,
      {
        headers: {
          Authorization: token,
          'Content-Type': 'application/json',
        },
      },
    );
    return response.data;
  } catch (error) {
    throw { message: `Cannot create question due to error: ${error.message}` };
  }
};

export const fetchQuestions = async ({ url, token }) => {
  const response = await axios.get(`${url}/questions`);
  if (response.status !== 200) {
    return constructError(response);
  }
  return response.data;
};

export const fetchUserQuestions = async ({ url, user_id }) => {
  const response = await axios.get(`${url}/questions/users/${user_id}`);
  if (response.status !== 200) {
    return constructError(response);
  }
  return response.data;
};

/**
 * Fetch questions with the provided Tag 
 * @param {*} url - Server URL
 * @param {*} tag - question tag text
 */
export const fetchTaggedQuestions = async ({ url, tag }) => {
  const response = await axios.get(`${url}/questions/tags/${tag}`);
  if (response.status !== 200) {
    return constructError(response);
  }
  return response.data;
};

/**
 * Fetch body images data from server
 * @param {url} API server address
 * @return array of objects which contains image id and url
 */
export const fetchBodyImages = async ({ url }) => {
  const response = await axios.get(`${url}/avatar_bodies`);
  if (response.status !== 200) {
    return constructError(response);
  }
  return response.data;
};

/**
 * Fetch eyes images data from a server
 * @param {url} API server address
 * @return an array of objects which contains image id and url
 */
export const fetchEyesImages = async ({ url }) => {
  const response = await axios.get(`${url}/avatar_eyes`);
  if (response.status !== 200) {
    return constructError(response);
  }
  return response.data;
};

/**
 * Fetch noses images data from a server
 * @param {url} API server address
 * @return an array of objects which contains image id and url
 */
export const fetchNosesImages = async ({ url }) => {
  const response = await axios.get(`${url}/avatar_noses`);
  if (response.status !== 200) {
    return constructError(response);
  }
  return response.data;
};

/**
 * Fetch hairs images data from a server
 * @param {url} API server address
 * @return an array of objects which contains image id and url
 */
export const fetchHairsImages = async ({ url }) => {
  const response = await axios.get(`${url}/avatar_hairs`);
  if (response.status !== 200) {
    return constructError(response);
  }
  return response.data;
};
