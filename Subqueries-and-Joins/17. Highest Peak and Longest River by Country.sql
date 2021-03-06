SELECT TOP(5) c.CountryName, MAX(p.Elevation) AS HighestPeakElevation, MAX(r.Length) AS LongestRiverLength FROM Countries c
RIGHT JOIN MountainsCountries mc ON mc.CountryCode = c.CountryCode
RIGHT JOIN Peaks p ON p.MountainId = mc.MountainId
INNER JOIN CountriesRivers cr ON cr.CountryCode = c.CountryCode
LEFT JOIN Rivers r ON r.Id = cr.RiverId
GROUP BY c.CountryName
ORDER BY HighestPeakElevation DESC, LongestRiverLength DESC, c.CountryName;