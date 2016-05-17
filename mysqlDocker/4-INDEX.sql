use computer-database-db;

CREATE INDEX idx_name on computer(name);
CREATE INDEX idx_introduced on computer(introduced);
CREATE INDEX idx_discontinued on computer(discontinued);
CREATE INDEX idx_company_id on computer(company_id);

