import axios, { isAxiosError } from 'axios';

const API_URL = 'http://localhost:8000';

export const fetchTables = async () => {
  try {
    const response = await axios.get(`${API_URL}/tables`);
    return response.data.tables;
  } catch (error: unknown) {
    if (isAxiosError(error))
        throw new Error('Error fetching tables: ' + error.message);
    else
        throw new Error('Unknown fetching tables error');
  }
};

export const fetchSchema = async (tableName: string) => {
  try {
    const response = await axios.get(`${API_URL}/tables/${tableName}`);
    return response.data.schema;
	} catch (error: unknown) {
    if (isAxiosError(error))
        throw new Error('Error fetching schemas: ' + error.message);
    else
        throw new Error('Unknown fetching schemas error');
  }
};