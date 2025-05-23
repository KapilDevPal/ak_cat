import React, { useState, useEffect } from 'react';
import { useParams, Link } from 'react-router-dom';
import {
  Container, Grid, Card, CardContent, CardMedia, Typography, Box, Paper, Divider, List, ListItem, ListItemText, ListItemIcon, IconButton, useTheme, Chip, Stack
} from '@mui/material';
import ArrowBackIcon from '@mui/icons-material/ArrowBack';
import StarIcon from '@mui/icons-material/Star';
import FavoriteIcon from '@mui/icons-material/Favorite';
import EmojiObjectsIcon from '@mui/icons-material/EmojiObjects';
import LocationOnIcon from '@mui/icons-material/LocationOn';
import CelebrationIcon from '@mui/icons-material/Celebration';
import MusicNoteIcon from '@mui/icons-material/MusicNote';
import PersonIcon from '@mui/icons-material/Person';
import CategoryIcon from '@mui/icons-material/Category';
import AutoStoriesIcon from '@mui/icons-material/AutoStories';

const pixelGradient = 'linear-gradient(135deg, #ff9800 0%, #ff3d00 100%)';
const pixelGradient2 = 'linear-gradient(135deg, #00bcd4 0%, #8bc34a 100%)';
const pixelGradient3 = 'linear-gradient(135deg, #7c4dff 0%, #00e676 100%)';

const GodDetail = () => {
  const { id } = useParams();
  const [god, setGod] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const theme = useTheme();

  useEffect(() => {
    const fetchGodDetails = async () => {
      try {
        const response = await fetch(`/api/v1/bx_block_god/gods/${id}`);
        if (!response.ok) {
          throw new Error('Failed to fetch god details');
        }
        const data = await response.json();
        setGod(data.god);
      } catch (err) {
        setError(err.message);
      } finally {
        setLoading(false);
      }
    };
    fetchGodDetails();
  }, [id]);

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

  if (!god) {
    return (
      <Box sx={{ display: 'flex', justifyContent: 'center', alignItems: 'center', minHeight: '100vh' }}>
        <Typography variant="h5">God not found</Typography>
      </Box>
    );
  }

  const InfoChip = ({ label, icon, gradient }) => (
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

  return (
    <Box sx={{ bgcolor: 'background.default', minHeight: '100vh', py: 4 }}>
      <Container>
        <Box sx={{ mb: 4 }}>
          <IconButton
            component={Link}
            to="/hindu_gods"
            sx={{ mb: 2 }}
          >
            <ArrowBackIcon />
          </IconButton>
          <Typography variant="h4" component="h1" gutterBottom sx={{ fontWeight: 800, letterSpacing: 1, color: 'primary.main' }}>
            {god.name}
          </Typography>
          <Typography variant="h6" color="text.secondary" gutterBottom sx={{ fontWeight: 500 }}>
            {god.sanskrit_name}
          </Typography>
        </Box>

        <Grid container spacing={4}>
          <Grid item xs={12} md={4}>
            <Card sx={{ borderRadius: 4, boxShadow: 6, overflow: 'hidden' }}>
              <CardMedia
                component="img"
                height="400"
                image={god.image_url || 'https://via.placeholder.com/300x400?text=Hindu+God'}
                alt={god.name}
                sx={{ objectFit: 'cover' }}
              />
            </Card>
          </Grid>

          <Grid item xs={12} md={8}>
            <Stack direction="row" spacing={1} sx={{ flexWrap: 'wrap', mb: 3 }}>
              {god.role && <InfoChip label={god.role} icon={<CategoryIcon />} gradient={pixelGradient} />}
              {god.category && <InfoChip label={god.category} icon={<StarIcon />} gradient={pixelGradient2} />}
              {god.consort_of && <InfoChip label={`Consort of ${god.consort_of}`} icon={<FavoriteIcon />} gradient={pixelGradient3} />}
              {god.avatar_of && <InfoChip label={`Avatar of ${god.avatar_of}`} icon={<PersonIcon />} gradient={pixelGradient} />}
            </Stack>

            <Paper sx={{ p: 3, mb: 3, borderRadius: 4, boxShadow: 3 }}>
              <Typography variant="h6" gutterBottom sx={{ fontWeight: 600, display: 'flex', alignItems: 'center', gap: 1 }}>
                <AutoStoriesIcon /> Description
              </Typography>
              <Typography variant="body1" paragraph>
                {god.description}
              </Typography>
            </Paper>

            <Grid container spacing={3}>
              {god.significance && (
                <Grid item xs={12} md={6}>
                  <Paper sx={{ p: 3, height: '100%', borderRadius: 4, boxShadow: 3 }}>
                    <Typography variant="h6" gutterBottom sx={{ fontWeight: 600, display: 'flex', alignItems: 'center', gap: 1 }}>
                      <StarIcon /> Significance
                    </Typography>
                    <Typography variant="body1">
                      {god.significance}
                    </Typography>
                  </Paper>
                </Grid>
              )}

              {god.mantras && (
                <Grid item xs={12} md={6}>
                  <Paper sx={{ p: 3, height: '100%', borderRadius: 4, boxShadow: 3 }}>
                    <Typography variant="h6" gutterBottom sx={{ fontWeight: 600, display: 'flex', alignItems: 'center', gap: 1 }}>
                      <EmojiObjectsIcon /> Mantras
                    </Typography>
                    <Typography variant="body1">
                      {god.mantras}
                    </Typography>
                  </Paper>
                </Grid>
              )}

              {god.festivals && (
                <Grid item xs={12} md={6}>
                  <Paper sx={{ p: 3, height: '100%', borderRadius: 4, boxShadow: 3 }}>
                    <Typography variant="h6" gutterBottom sx={{ fontWeight: 600, display: 'flex', alignItems: 'center', gap: 1 }}>
                      <CelebrationIcon /> Festivals
                    </Typography>
                    <Typography variant="body1">
                      {god.festivals}
                    </Typography>
                  </Paper>
                </Grid>
              )}

              {god.temples && (
                <Grid item xs={12} md={6}>
                  <Paper sx={{ p: 3, height: '100%', borderRadius: 4, boxShadow: 3 }}>
                    <Typography variant="h6" gutterBottom sx={{ fontWeight: 600, display: 'flex', alignItems: 'center', gap: 1 }}>
                      <LocationOnIcon /> Temples
                    </Typography>
                    <Typography variant="body1">
                      {god.temples}
                    </Typography>
                  </Paper>
                </Grid>
              )}
            </Grid>
          </Grid>
        </Grid>
      </Container>
    </Box>
  );
};

export default GodDetail; 