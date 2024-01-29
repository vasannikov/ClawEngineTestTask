using UnityEngine;

public class FunnelCreator : MonoBehaviour
{
    public Terrain terrain;

    private void OnCollisionEnter(Collision collision)
    {
        if (collision.gameObject.GetComponent<Rigidbody>() != null)
        {
            ContactPoint contact = collision.contacts[0];
            Vector3 position = contact.point;
            float radius = 5.0f; // You can adjust the radius based on the contact or object size/mass

            CreateFunnelAtPosition(position, radius);
        }
    }

    private void CreateFunnelAtPosition(Vector3 position, float radius)
    {
        // Here you can modify the terrain to create a funnel at the specified position with the given radius
        // You can use terrain modification methods to achieve this effect
        // For example, you can use TerrainData to modify the terrain heights or add textures to the area

        Debug.Log("Funnel created at position: " + position + " with radius: " + radius);
    }
}
