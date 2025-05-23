import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import {
  Container, Grid, Card, CardContent, CardMedia, Typography, Tabs, Tab, Box, IconButton, ThemeProvider, createTheme, CssBaseline, Paper, Chip, Button, Stack
} from '@mui/material';
import Brightness4Icon from '@mui/icons-material/Brightness4';
import Brightness7Icon from '@mui/icons-material/Brightness7';
import ArrowForwardIosIcon from '@mui/icons-material/ArrowForwardIos';
import MusicNoteIcon from '@mui/icons-material/MusicNote';
import EmojiObjectsIcon from '@mui/icons-material/EmojiObjects';
import StarsIcon from '@mui/icons-material/Stars';
import TagIcon from '@mui/icons-material/Tag';

const pixelGradient = 'linear-gradient(135deg, #ff9800 0%, #ff3d00 100%)';
const pixelGradient2 = 'linear-gradient(135deg, #00bcd4 0%, #8bc34a 100%)';
const pixelGradient3 = 'linear-gradient(135deg, #7c4dff 0%, #00e676 100%)';

const cardStyles = {
  height: 420,
  display: 'flex',
  flexDirection: 'column',
  borderRadius: 4,
  boxShadow: 6,
  color: '#fff',
  position: 'relative',
  overflow: 'hidden',
};

const contentStyles = {
  flexGrow: 1,
  display: 'flex',
  flexDirection: 'column',
  p: 2,
  height: '100%',
};

const descriptionStyles = {
  mb: 2,
  flexGrow: 1,
  overflow: 'hidden',
  textOverflow: 'ellipsis',
  display: '-webkit-box',
  WebkitLineClamp: 3,
  WebkitBoxOrient: 'vertical',
  minHeight: '4.5em',
  color: 'rgba(255,255,255,0.92)',
};

const HomePage = () => {
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [value, setValue] = useState(0);
  const [darkMode, setDarkMode] = useState(false);
  const [gods, setGods] = useState([]);
  const [bhajans, setBhajans] = useState([]);
  const [bhajansLoading, setBhajansLoading] = useState(false);

  const theme = createTheme({
    palette: {
      mode: darkMode ? 'dark' : 'light',
      primary: {
        main: '#1976d2',
      },
      secondary: {
        main: '#dc004e',
      },
    },
    shape: {
      borderRadius: 18,
    },
  });

  useEffect(() => {
    const fetchGods = async () => {
      try {
        const response = await fetch('/api/v1/bx_block_god/gods');
        if (!response.ok) {
          throw new Error('Failed to fetch data');
        }
        const data = await response.json();
        setGods(data.gods);
      } catch (err) {
        setError(err.message);
      } finally {
        setLoading(false);
      }
    };
    fetchGods();
  }, []);

  // Fetch bhajans only when Bhajans tab is selected
  useEffect(() => {
    if (value === 3) {
      setBhajansLoading(true);
      fetch('/api/v1/bx_block_god/bhajans')
        .then(res => res.json())
        .then(data => {
          setBhajans(data.bhajans || []);
        })
        .catch(() => setBhajans([]))
        .finally(() => setBhajansLoading(false));
    }
  }, [value]);

  const handleChange = (event, newValue) => {
    setValue(newValue);
  };

  const toggleDarkMode = () => {
    setDarkMode(!darkMode);
  };

  if (loading) {
    return (
      <Box sx={{ display: 'flex', justifyContent: 'center', alignItems: 'center', minHeight: '100vh' }}>
        <Typography variant="h5">Loading...</Typography>
      </Box>
    );
  }

  if (error) {
    return (
      <Box sx={{ display: 'flex', justifyContent: 'center', alignItems: 'center', minHeight: '100vh' }}>
        <Typography variant="h5" color="error">Error: {error}</Typography>
      </Box>
    );
  }

  const majorGods = gods.filter(god => god.category === 'trimurti');
  const tridevi = gods.filter(god => god.category === 'tridevi');
  const popularDeities = gods.filter(god => god.category === 'devotion');

  // Helper for tags
  const TagChip = ({ label, icon, color, gradient }) => (
    <Chip
      label={label}
      icon={icon}
      sx={{
        background: gradient,
        color: '#fff',
        fontWeight: 500,
        mr: 1,
        mb: 1,
        boxShadow: 2,
        letterSpacing: 0.5,
        fontSize: '0.95rem',
      }}
      size="small"
    />
  );

  const renderGodCard = (god, idx) => (
    <Grid item xs={12} sm={6} md={4} key={god.id}>
      <Card
        sx={{
          ...cardStyles,
          background: idx % 3 === 0 ? pixelGradient : idx % 3 === 1 ? pixelGradient2 : pixelGradient3,
        }}
      >
        <CardMedia
          component="img"
          height="160"
          image={god.image_url || 'https://via.placeholder.com/300x200?text=Hindu+God'}
          alt={god.name}
          sx={{ objectFit: 'cover', borderRadius: '0 0 32px 32px', boxShadow: 2 }}
        />
        <CardContent sx={contentStyles}>
          <Typography gutterBottom variant="h5" component="div" sx={{ fontWeight: 700, letterSpacing: 1, minHeight: '1.5em' }}>
            {god.name}
          </Typography>
          <Typography variant="subtitle1" color="rgba(255,255,255,0.85)" gutterBottom sx={{ fontWeight: 500, minHeight: '1.5em' }}>
            {god.sanskrit_name}
          </Typography>
          <Stack direction="row" spacing={1} sx={{ flexWrap: 'wrap', mb: 1, minHeight: '2.5em' }}>
            {god.significance && <TagChip label={god.significance} icon={<StarsIcon />} gradient={pixelGradient2} />}
            {god.mantras && <TagChip label={god.mantras} icon={<EmojiObjectsIcon />} gradient={pixelGradient3} />}
            {god.role && <TagChip label={god.role} icon={<TagIcon />} gradient={pixelGradient} />}
            {god.avatar_of && <TagChip label={`Avatar of ${god.avatar_of}`} icon={<TagIcon />} gradient={pixelGradient3} />}
            {god.consort_of && <TagChip label={`Consort: ${god.consort_of}`} icon={<TagIcon />} gradient={pixelGradient2} />}
          </Stack>
          <Typography variant="body2" sx={descriptionStyles}>
            {god.description}
          </Typography>
          <Box sx={{ mt: 'auto', display: 'flex', justifyContent: 'flex-end' }}>
            <Button
              variant="contained"
              color="secondary"
              endIcon={<ArrowForwardIosIcon />}
              component={Link}
              to={`/hindu_gods/${god.id}`}
              sx={{ borderRadius: 8, fontWeight: 600, boxShadow: 3, px: 2, py: 0.5 }}
            >
              Learn More
            </Button>
          </Box>
        </CardContent>
      </Card>
    </Grid>
  );

  const renderBhajanCard = (bhajan, idx) => (
    <Grid item xs={12} sm={6} md={4} key={bhajan.id}>
      <Card
        sx={{
          ...cardStyles,
          background: idx % 2 === 0 ? pixelGradient2 : pixelGradient3,
        }}
      >
        <CardContent sx={contentStyles}>
          <Stack direction="row" spacing={1} sx={{ flexWrap: 'wrap', mb: 1, minHeight: '2.5em' }}>
            <TagChip label={bhajan.bhajan_type} icon={<MusicNoteIcon />} gradient={pixelGradient} />
            {bhajan.god_name && <TagChip label={bhajan.god_name} icon={<StarsIcon />} gradient={pixelGradient2} />}
          </Stack>
          <Typography variant="h6" component="div" gutterBottom sx={{ fontWeight: 700, letterSpacing: 1, minHeight: '1.5em' }}>
            {bhajan.title || 'Untitled Bhajan'}
          </Typography>
          <Typography
            variant="body2"
            sx={{
              ...descriptionStyles,
              WebkitLineClamp: 5,
            }}
          >
            {bhajan.text}
          </Typography>
          <Box sx={{ mt: 'auto', display: 'flex', justifyContent: 'flex-end' }}>
            <Button
              variant="contained"
              color="primary"
              endIcon={<ArrowForwardIosIcon />}
              component={Link}
              to={`/hindu_gods/${bhajan.god_id}`}
              sx={{ borderRadius: 8, fontWeight: 600, boxShadow: 3, px: 2, py: 0.5 }}
            >
              View God
            </Button>
          </Box>
        </CardContent>
      </Card>
    </Grid>
  );

  return (
    <ThemeProvider theme={theme}>
      <CssBaseline />
      <Box sx={{ bgcolor: 'background.default', minHeight: '100vh', py: 4 }}>
        <Container>
          <Box sx={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', mb: 4 }}>
            <Typography variant="h4" component="h1" gutterBottom sx={{ fontWeight: 800, letterSpacing: 1, color: 'primary.main' }}>
              Hindu Gods & Devotional Content
            </Typography>
            <IconButton onClick={toggleDarkMode} color="inherit">
              {darkMode ? <Brightness7Icon /> : <Brightness4Icon />}
            </IconButton>
          </Box>

          <Paper sx={{ mb: 4, borderRadius: 4, boxShadow: 4 }}>
            <Tabs
              value={value}
              onChange={handleChange}
              variant="scrollable"
              scrollButtons="auto"
              sx={{ borderBottom: 1, borderColor: 'divider' }}
            >
              <Tab label="Trimurti" />
              <Tab label="Tridevi" />
              <Tab label="Popular Deities" />
              <Tab label="Bhajans & Devotional" />
            </Tabs>
          </Paper>

          <Box sx={{ mt: 3 }}>
            {value === 0 && (
              <Grid container spacing={3}>
                {majorGods.map(renderGodCard)}
              </Grid>
            )}
            {value === 1 && (
              <Grid container spacing={3}>
                {tridevi.map(renderGodCard)}
              </Grid>
            )}
            {value === 2 && (
              <Grid container spacing={3}>
                {popularDeities.map(renderGodCard)}
              </Grid>
            )}
            {value === 3 && (
              bhajansLoading ? (
                <Box sx={{ display: 'flex', justifyContent: 'center', alignItems: 'center', minHeight: 200 }}>
                  <Typography variant="h6">Loading Bhajans...</Typography>
                </Box>
              ) : (
                <Grid container spacing={3}>
                  {bhajans.length === 0 ? (
                    <Grid item xs={12}>
                      <Typography variant="h6" align="center" color="text.secondary">
                        No Bhajans found.
                      </Typography>
                    </Grid>
                  ) : (
                    bhajans.map(renderBhajanCard)
                  )}
                </Grid>
              )
            )}
          </Box>
        </Container>
      </Box>
    </ThemeProvider>
  );
};

export default HomePage; 